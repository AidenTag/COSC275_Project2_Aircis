#include "heap_alloc.h"
#include <stdint.h>
#include "io.h"
#include "kernel_stub.h"
#include "types.h"

/*Task 1: heap_alloc*/

void heap_test() {
   heap_init();
   address_t curr_heap_limit = heap_limit;
   int* ptr1 = (int*)allocate(sizeof(int));

   if (ptr1 == NULL) {
      print("[heap_test:] Allocation failed for ptr1\n");
      halt_kernel();
   }
   if (heap_limit != curr_heap_limit + sizeof(int) + sizeof(header_s)) {
      print("[heap_test:] Heap limit did not increase correctly after ptr1 allocation\n");
      halt_kernel();
   }
   curr_heap_limit = heap_limit;

   int* ptr2 = (int*)allocate(8);

   if (ptr2 == NULL) {
      print("[heap_test:] Allocation failed for ptr2\n");
      halt_kernel();
   }
   if (heap_limit != curr_heap_limit + 8 + sizeof(header_s)) {
      print("[heap_test:] Heap limit did not increase correctly after ptr2 allocation\n");
      halt_kernel();
   }

   address_t addr_of_ptr1 = (address_t)ptr1;

   deallocate(ptr1);
   deallocate(ptr1); // try deallocating ptr1 again, shouldn't work

   if (*(int32_t*)(addr_of_ptr1 - sizeof(header_s)) >= 0) {
      print("[heap_test:] Deallocation did not mark ptr1 as free\n");
      halt_kernel();
   }

   int* ptr3 = (int*)allocate(16); // allocate something bigger, make sure doesn't reuse ptr1's space

   if ((address_t) ptr3 == addr_of_ptr1) {
      print("[heap_test:] Allocation reused freed space for ptr3 when it shouldn't have\n");
      halt_kernel();
   }

   int* ptr4 = (int*)allocate(sizeof(int)); // try to put something in the free space of ptr1

   if ((address_t) ptr4 != addr_of_ptr1) {
      print("[heap_test:] Allocation did not reuse freed space for ptr3\n");
      halt_kernel();
   }

   print("[heap_test:] All tests passed\n");
}