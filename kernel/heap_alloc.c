/* =============================================================================================================================== */
/**
 * Manage a standard heap.
 *
 * \file heap_alloc.c
 */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* INCLUDES */

#include <stdint.h>

#include "heap_alloc.h"
#include "io.h"
#include "kernel_stub.h"
#include "types.h"
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* MACROS */

#define ADDR_SIZE (sizeof(address_t))
#define ALIGN_UP(addr) (addr % ADDR_SIZE == 0 ? addr : (addr + ADDR_SIZE) & ~(ADDR_SIZE - 1))

#define HEADER_TO_BLOCK(p) ((void*)((address_t)p + sizeof(header_s)))
#define BLOCK_TO_HEADER(p) ((header_s*)((address_t)p - sizeof(header_s)))
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* TYPES & STRUCTS */

typedef struct header {

  word_t         size;
  struct header* next;
  struct header* prev;
  
} header_s;
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* STATICS */

/* A pair of sentinels to the free list, making the coding easier. */
header_s free_head = { .next = NULL, .prev = NULL, .size = 0 };
header_s free_tail = { .next = NULL, .prev = NULL, .size = 0 };

/* The current limit of the heap. */
address_t heap_limit = (address_t)NULL;

/* The externally provided end of the statics, at which the heap will begin. */
extern address_t statics_limit;
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/**
 * Initialize the heap.  If it is already initialized, do nothing.
 */
void heap_init () {

  /* Continue only if the heap is uninitialized. */
  if (heap_limit != (address_t)NULL) return;

  /* Start the heap where the statics end. */
  heap_limit = (address_t)&statics_limit;

  /* Initialize the sentinels that bookend the free block list. */
  free_head.next = &free_tail;
  free_tail.prev = &free_head;
  
} /* heap_init () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
void* allocate (int size) {

  print("[debug: ] allocate(");
  print_dec(size);
  print(") -> 0x");
  
  /* Ensure that the heap is initialized. */
  heap_init();

  /* Find/create a block, and return the pointer to it. */
  void* ptr = NULL;
  
  /* TO BE COMPLETED */

  void* cursor = statics_limit;
  word_t current_block_size = *(word_t*)cursor;

  while (
    /* keep advancing when... */
    (current_block_size > 0 /* in use */ || current_block_size < size) /* too small */ 
    &&
    /* but leave if ever not... */
    cursor < heap_limit /* in existing blocks */
  ) {
    cursor += current_block_size + 4;
    current_block_size = *(word_t*)cursor;
  }

  /* Word at cursor becomes header for new block (which just means we bump heap_limit) if we're at the heap_limit  */
  ptr = cursor + 4;
  *(word_t*)cursor = size; /* update header */
  if (cursor >= heap_limit) {
    heap_limit += size + 4;
  }


  

  /* Could be that we run into the stack, in which case heap_limit + 4 + size > sp */

  *(word_t*)heap_limit = size; /* then to deallocate we make it negative */
  

  

  

  /* Assuming that `ptr` has been set to point to a newly allocated block, show its address and then return it. */
  print_hex((word_t)ptr);
  print("\n");
  return ptr;
  
} /* allocate () */
/* =============================================================================================================================== */


/* =============================================================================================================================== */
void deallocate (void* ptr) {

  /* Do nothing if there is no block. */
  if (ptr == NULL) return;

  print("[debug: ] deallocate(0x");
  print_hex((word_t)ptr);
  print(") [size = ");

  header_s* header;
  
  /* TO BE COMPLETED */
  ptr -= 4; /* make sure we're pointing to the header not the start of the data in the block */

  word_t ptr_block_header_val = *(word_t*)ptr;
  if (ptr_block_header_val > 0) {
    *(word_t*)ptr *= -1; /* make it negative */
  } else {
    print("Cannot deallocate deallocated block.");
  }

  print_dec(header->size);
  print("]\n");
  
} /* deallocate () */
/* =============================================================================================================================== */
