/* =============================================================================================================================== */
/* INCLUDES */

#include <stdbool.h>
#include <stdint.h>

#include "heap_alloc.h"
#include "io.h"
#include "kernel_stub.h"
#include "mm_alloc.h"
#include "types.h"
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* CONSTANTS */

#define INIT_ROM_NUMBER 3

#define SYSCALL_NOOP    0xca110000
#define SYSCALL_EXIT	0xca110001
#define SYSCALL_PRINT   0xca110002
#define SYSCALL_RUN     0xca110003

#define SYSCALL_INVALID_CODE -1

#define QUANTUM 5000 //what to set this value as??

/**
 * The offset of where `a0` is stored on the preservation stack relative to `sp`.  `a0 = x10`, so it is the 10th register,
 * subtracting the 2 that are not preserved (`zero` and `sp` itself), plus 1 for starting one full word back from `sp`.
 */
#define PRESERVED_A0_OFFSET ( -(10 - 2 + 1) * BYTES_PER_WORD )
/* =============================================================================================================================== */

/* =============================================================================================================================== */
/* TYPES & STRUCTS */

typedef struct process_info_object {

  word_t epc;
  word_t sp;
  word_t bs;
  word_t lm;
  word_t id;
  struct process_info_object* next;

  
} process_info_object_s;
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* GLOBALS */

word_t next_ROM_number = INIT_ROM_NUMBER;

address_t user_base    = 0;
address_t user_limit   = 0;
word_t    user_size    = 0;
int    next_id      = 0;

//we chose to remove latest_process

process_info_object_s* current_process = NULL; // this is the actual process that is running





/* =============================================================================================================================== */
/**
 * Schedule (jump into) the current process.
 */
void cpu_scheduler () {
  /* Jump to the current process, giving it a new quantum. */
  set_alarm(QUANTUM);
  userspace_jump(preserved_epc, preserved_sp, user_base, user_limit);
  
} // cpu_scheduler ()


/* =============================================================================================================================== */

int do_run (int ROM_number) {

  print("[kernel:] RUN ROM #");
  print_dec(ROM_number);
  print("\n");

  /* Reject ROMs 1-3, but only once a process exists. While current_process is NULL, the kernel is booting init (ROM 3). */
  if (current_process != NULL && ROM_number <= INIT_ROM_NUMBER) {
    print("[kernel:] Invalid ROM number\n");
    return -1;
  }

  dt_entry_s* dt_ROM_ptr = find_device(ROM_device_code, ROM_number);
  if (dt_ROM_ptr == NULL) {
    print("[kernel:] Invalid ROM number\n");
    return -1;
  }

  process_info_object_s* process = allocate(sizeof(process_info_object_s));
  if (process == NULL) {
    print("[kernel:] Process allocation failed for ROM #");
    print_dec(ROM_number);
    print("\n");
    return -2;
  }

  address_t base = mm_allocate();
  if (base == 0) {
    deallocate(process);
    print("[kernel:] Main memory allocation failed for ROM #");
    print_dec(ROM_number);
    print("\n");
    return -3;
  }

  word_t size = dt_ROM_ptr->limit - dt_ROM_ptr->base;
  if (size > MM_BLOCK_SIZE) {
    deallocate(process);
    mm_deallocate(base);
    print("[kernel:] ROM is too large to fit in main memory\n");
    return -4;
  }

  DMA_portal_ptr->src    = dt_ROM_ptr->base;
  DMA_portal_ptr->dst    = base;
  DMA_portal_ptr->length = size;   /* triggers the copy */

  process->epc = 0;
  process->sp  = MM_BLOCK_SIZE;
  process->bs  = base;
  process->lm  = base + MM_BLOCK_SIZE;
  process->id  = next_id;

  if (current_process == NULL) {
    process->next = process;
    current_process = process;
  } else {
    process->next = current_process->next;
    current_process->next = process;
  }

  return next_id++;
}


/* =============================================================================================================================== */
/**
 * Run the next ROM.  _Returns only if there are no more ROMs to load._
 */
void run_next () {

  print("[kernel:] RUN ROM #");
  print_dec(next_ROM_number);
  print("\n");

  /* Lookup the ROM.  If it isn't a valid ROM number, halt the system. */
  dt_entry_s* dt_ROM_ptr = find_device(ROM_device_code, next_ROM_number);
  if (dt_ROM_ptr == NULL) {
    return;
  }

  /* Load the executable into the process's space. */
  // Project 2: do_run now does this copy, into the new process's own 32 KB block.
  // DMA_portal_ptr->src    = dt_ROM_ptr->base;
  // DMA_portal_ptr->dst    = user_base;
  // DMA_portal_ptr->length = dt_ROM_ptr->limit - dt_ROM_ptr->base; // Trigger

  /* Project 2: create the process through do_run so it gets a record and its own block. */
  int pid = do_run(next_ROM_number);
  if (pid < 0) {
    return;   // run_init then prints "Failed to run, no user ROMs" and halts
  }

  /* Prepare the initial epc and sp. */
  // Project 2: take them from the new process's record instead of fixed values.
  // preserved_epc = 0;
  // preserved_sp  = user_size;
  preserved_epc = current_process->epc;
  preserved_sp  = current_process->sp;
  user_base     = current_process->bs;
  user_limit    = current_process->lm;

  /* Store the next ROM on deck, then jump to this newly loaded one. */
  next_ROM_number += 1;
  cpu_scheduler();

} /* run_next () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/**
 * Perform the NOOP syscall.
 */
void do_noop () {

  DEBUG("NOOP requested");

  /* Advance the process PC so that it resumes after the ecall. */
  preserved_epc += 4;

} /* do_noop () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/**
 * Perform the EXIT syscall.  Terminate this one and load the next.  _Returns only if there are no more ROMs to load._
 *
 * \param status The exiting status of the process.
 */
void do_exit (word_t status) {

  print("[kernel:] EXIT process with status ");
  print_dec(status);
  print("\n");

  process_info_object_s* process_to_remove = current_process;


  //if curr_process->next = curr_process, has hit the end of the list (its circular so its pointing back at itself), so terminate
  if (process_to_remove->next == process_to_remove){
    print("[kernel:] completed all processes. \n");
    mm_deallocate(process_to_remove->bs); // main memory
    deallocate(process_to_remove); // process info object
    current_process = NULL;
    return;
  }


  while (current_process->next != process_to_remove){ //loop to find the prev
    current_process = current_process->next;
  }

  current_process->next = process_to_remove->next;   /* unlink process_to_remove*/

  current_process = current_process->next; /* move to the next process in the circular linked list */

  if (current_process != process_to_remove->next) {
    print("[kernel:] unlink failed\n");
    halt_kernel();
  } else{
    print("[kernel:] unlink worked!\n");
  }

    /* Deallocate the process's memory. */
  mm_deallocate(process_to_remove->bs); // main memory
  deallocate(process_to_remove); // process info object


  preserved_epc = current_process->epc;
  preserved_sp = current_process->sp;
  user_base = current_process->bs;
  user_limit = current_process->lm;



  /* Advance to the next ROM. */
  cpu_scheduler();

} /* do_exit () */
/* =============================================================================================================================== */


/* =============================================================================================================================== */
/**
 * Perform the PRINT syscall.  Print a given null-terminated string to the console.
 *
 * \param msg A pointer to a null-terminated string in the process's address space.
 * \return <code>0</code> if the message was successfully printed; <code>-1</code> otherwise (e.g., the string pointer was invalid.)
 */
word_t do_print (address_t msg) {

  /* Translate the string's pointer from a virtual to a physical address, verifying that it is in range. */
  msg = msg + user_base;
  if (msg >= user_limit) {
    return -1;
  }
  
  /* Make the printing happen. */
  print((char*)msg);

  /* Advance the process PC so that it resumes after the ecall. */
  preserved_epc += 4;
  
  return 0;
  
} /* do_print () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* =============================================================================================================================== */
/**
 * Carry out a syscall.  <b>Does not return.</b>
 *
 * \param code The requested syscall type
 * \param arg0 An additional argument; whether it is relevant depends upon which syscall is requested.
 */
void do_syscall (word_t code, word_t arg0) {

  /* Dispatch on the requested system call by code. */
  bool   has_return_value = false;
  word_t result           = 0;
  if (code == SYSCALL_NOOP) {
    
    do_noop();
    
  } else if (code == SYSCALL_EXIT) {
    
    do_exit(arg0);
    /* Special case: If this call returned, there were no more ROMs. */
    print("[kernel:] All processes terminated\n");
    halt_kernel();

  } else if (code == SYSCALL_PRINT) {
    
    has_return_value = true;
    result = do_print((address_t)arg0);

  } else if (code == SYSCALL_RUN) {
  /* Task 3: dispatch RUN and hand do_run's result back to the caller. */
  has_return_value = true;
  result = do_run((int)arg0); /* resume the caller after its ecall. Done here, not in do_run, because at boot run_next calls do_run with no caller to advance. */
  preserved_epc +=4;
} else {
    
    result = SYSCALL_INVALID_CODE;
    
  }

  /* If there is a return value, copy it into the current process's preserved a0 register space on its stack. */
  if (has_return_value) {
    word_t* preserved_a0 = (word_t*)(user_base + preserved_sp + PRESERVED_A0_OFFSET);
    *preserved_a0        = result;
  }

  /* Schedule a process. */
  cpu_scheduler();
}/* do_syscall () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/**
 * Manage a clock alarm interrupt.  _Does not return._
 */
void do_alarm () {

  /* Print a little info and then resume. */
  print("[kernel:] ALARM interrupt caught\n");

  //preserve sp, epc in the process  before switching to the new process
  current_process->epc = preserved_epc;
  current_process->sp = preserved_sp;
  current_process = current_process->next; /* move to the next process in the circular linked list */
  preserved_epc = current_process->epc;
  preserved_sp = current_process->sp;
  user_base = current_process->bs;
  user_limit = current_process->lm;
  
  cpu_scheduler();
  
} // do_alarm ()
/* =============================================================================================================================== */


void run_init () {

  /* Determine the user-space bounds. */
  user_base  = kernel_limit;
  user_limit = RAM_limit;
  user_size  = user_limit - user_base;
  
  /* Start the running of processes. */
  run_next();

  /* Special case:  That call returns only there were no user ROMs to load and execute. */
  print("[kernel:] Failed to run, no user ROMs\n");
  halt_kernel();

} /* run_init () */
/* =============================================================================================================================== */
