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
/* ADDR_SIZE is unsigned bc of sizeof. Cast the RESULT of ALIGN_UP to int32_t once, after rejecting size <= 0,
   and before comparing it with a (signed) header value to avoid comparison issue */
#define ALIGN_UP(addr) (((addr) % ADDR_SIZE == 0 ? (addr) : ((addr) + ADDR_SIZE) & ~(ADDR_SIZE - 1)))

#define HEADER_TO_BLOCK(p) ((void*)((address_t)(p) + sizeof(header_s)))
#define BLOCK_TO_HEADER(p) ((header_s*)((address_t)(p) - sizeof(header_s)))
#define HEAP_STACK_MARGIN 0x400


/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* TYPES & STRUCTS */

typedef struct header {

  int32_t         size; /*this way is signed*/

  
} header_s;
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/* STATICS */

/* A pair of sentinels to the free list, making the coding easier. */
/* removed them from our implicit struct
header_s free_head = { .next = NULL, .prev = NULL, .size = 0 };
header_s free_tail = { .next = NULL, .prev = NULL, .size = 0 };
*/

/* The current limit of the heap. */
address_t heap_start = 0;
address_t heap_limit = (address_t)NULL;
address_t heap_ceiling = 0;


/* The externally provided end of the statics, at which the heap will begin. */
extern address_t statics_limit;
/* =============================================================================================================================== */



/* =============================================================================================================================== */
/**
 * Initialize the heap.  If it is already initialized, do nothing.
 */
void heap_init () {

  /* Continue only if heap is uninitialized */
  if (heap_limit != (address_t)NULL) return;

  /* begins after statics */
  heap_start = ALIGN_UP((address_t)&statics_limit);

  heap_ceiling = kernel_limit - HEAP_STACK_MARGIN;

  /* at beginning, limit = start */
  heap_limit = (address_t)heap_start;

  /* Initialize the sentinels that bookend the free block list.--COMMENTED OUT: 
  we redid the header_struct not to have next or prev so this doesnt work anymore. */
  /*
  free_head.next = &free_tail;
  free_tail.prev = &free_head; */

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
  address_t cursor = heap_start;
  
  /* TO BE COMPLETED */ 
  if (size>0){
    /*make sure the size of thing being allocate is greater than 0, there is something to allocate.*/
    int32_t rounded = (int32_t)(ALIGN_UP(size));
    while( cursor < heap_limit){
      /*read the curr address (cursor) which should be the header (giving the size of this block)*/
      int32_t h_val = *((int32_t*)cursor);
      int32_t abs_val_size = h_val;
      /*if the size of block is negative flip for abs val, and check if its big enough since its free */
      if (h_val < 0){
        abs_val_size = -h_val;
        if (abs_val_size >= rounded){
          /*break if its big enough, found the right block*/
          break;
        }
      }
      cursor += sizeof(header_s) + abs_val_size;

    }
    /*if ended within existing heap, just flip sign on the size in header*/
    if (cursor < heap_limit) {
      ptr = HEADER_TO_BLOCK(cursor);
      *(int32_t*)cursor = -(*(int32_t*)cursor);
    } else {
      /*else, need to add new block at end of heap*/
      if (heap_ceiling - heap_limit >= sizeof(header_s)+rounded){
        *(int32_t*)heap_limit = rounded;
        ptr = HEADER_TO_BLOCK(heap_limit);
        heap_limit += sizeof(header_s) + rounded;
      } 
    }

  }

  /* Assuming that `ptr` has been set to point to a newly allocated block, show its address and then return it. */
  print_hex((word_t)ptr);
  print("\n");
  return ptr;
  
} /* allocate () */
/* =============================================================================================================================== */



/* =============================================================================================================================== */
void deallocate (void* ptr) {
 /* TO BE COMPLETED */
  /* Do nothing if there is no block. */
  if (ptr == NULL) return;                       

  print("[debug: ] deallocate(0x");              
  print_hex((word_t)ptr);
  print(") [size = ");

  header_s* header = BLOCK_TO_HEADER(ptr);
  if (header->size > 0) {                
    header->size *= -1; /* make it negative */
    /* CHANGE: negate header->size instead. Same 4 bytes, just reached through the struct. */
  } else {
    print("\n Cannot deallocate deallocated block.");
  }
  int32_t hs_abs_val = header->size;
  if(header->size < 0) {
    hs_abs_val = -(header->size);
  }
  print_dec(hs_abs_val);
  print("]\n");

} /* deallocate () */
/* =============================================================================================================================== */


