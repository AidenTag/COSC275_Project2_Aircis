# Project 2

## Marci, Aiden, Ailís

## Testing
To test, you must be in the proper environment (sys2). All commands below are run from the top folder of the repo (the one containing `bios/`, `kernel/` and `programs/`).

### Task 1: heap_alloc
1. Open testing.c in kernel
2. uncomment the code titled task 1: heap_alloc.c
3. uncomment heap_test() in kernel_stub.asm
4. run (sys2) $ cd kernel; make clean; make; cd ..
5. run (sys2) $ f-simulate bios/bios-rom.vmx kernel/kernel-rom.vmx
   The output should state that all tests pass, but seeing "Cannot deallocate deallocated block." once is expected
6. comment back the uncommented code and rebuild

### Tasks 2-6: do_run, RUN, do_exit, do_alarm, cpu_scheduler
1. make sure the testing code is commented out, then build:
   (sys2) $ cd kernel; make clean; make; cd ..
2. run (one line):
   (sys2) $ f-simulate bios/bios-rom.vmx kernel/kernel-rom.vmx programs/init-rom.vmx programs/longloop-rom.vmx
3. at the prompt type `step 1000000`, then `show console text`. keep doing that and re-checking the console.
   (it pauses at every syscall/alarm, and the console only shows 24 lines)

What you should see:
- do_run: "RUN ROM #3" at boot, then init runs ROM #4 (longloop). Init then tries ROM #5, which prints "Invalid ROM number" and "No such ROM; done."
- allocate/deallocate: "[debug: ] allocate(24) -> ..." when a process is created, and a matching "deallocate(...) [size = 24]" after the init process exits
- RUN syscall: init gets the new pid back ("New pid = 1") and stops when there are no more ROMs
- do_exit: "EXIT process with status 0" followed by "unlink worked!"
- do_alarm / cpu_scheduler: "[longloop:] i = ..." appears, and "ALARM interrupt caught" keeps showing up on every step