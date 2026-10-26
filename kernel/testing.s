	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_zmmul1p0"
	.file	"testing.c"
	.globl	heap_test                       # -- Begin function heap_test
	.p2align	2
	.type	heap_test,@function
heap_test:                              # @heap_test
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	call	heap_init
testing_Lpcrel_hi0:
	auipc	a0, %pcrel_hi(heap_limit)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi0)
	lw	a0, 0(a0)
	sw	a0, -12(s0)
	li	a0, 4
	call	allocate
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	bnez	a0, testing_LBB0_2
	j	testing_LBB0_1
testing_LBB0_1:
testing_Lpcrel_hi1:
	auipc	a0, %pcrel_hi(testing_L.str)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi1)
	call	print
	call	halt_kernel
	j	testing_LBB0_2
testing_LBB0_2:
testing_Lpcrel_hi2:
	auipc	a0, %pcrel_hi(heap_limit)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi2)
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	addi	a1, a1, 8
	beq	a0, a1, testing_LBB0_4
	j	testing_LBB0_3
testing_LBB0_3:
testing_Lpcrel_hi3:
	auipc	a0, %pcrel_hi(testing_L.str.1)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi3)
	call	print
	call	halt_kernel
	j	testing_LBB0_4
testing_LBB0_4:
testing_Lpcrel_hi4:
	auipc	a0, %pcrel_hi(heap_limit)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi4)
	lw	a0, 0(a0)
	sw	a0, -12(s0)
	li	a0, 8
	call	allocate
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	bnez	a0, testing_LBB0_6
	j	testing_LBB0_5
testing_LBB0_5:
testing_Lpcrel_hi5:
	auipc	a0, %pcrel_hi(testing_L.str.2)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi5)
	call	print
	call	halt_kernel
	j	testing_LBB0_6
testing_LBB0_6:
testing_Lpcrel_hi6:
	auipc	a0, %pcrel_hi(heap_limit)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi6)
	lw	a0, 0(a0)
	lw	a1, -12(s0)
	addi	a1, a1, 12
	beq	a0, a1, testing_LBB0_8
	j	testing_LBB0_7
testing_LBB0_7:
testing_Lpcrel_hi7:
	auipc	a0, %pcrel_hi(testing_L.str.3)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi7)
	call	print
	call	halt_kernel
	j	testing_LBB0_8
testing_LBB0_8:
	lw	a0, -16(s0)
	sw	a0, -24(s0)
	lw	a0, -16(s0)
	call	deallocate
	lw	a0, -24(s0)
	lw	a0, -4(a0)
	bltz	a0, testing_LBB0_10
	j	testing_LBB0_9
testing_LBB0_9:
testing_Lpcrel_hi8:
	auipc	a0, %pcrel_hi(testing_L.str.4)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi8)
	call	print
	call	halt_kernel
	j	testing_LBB0_10
testing_LBB0_10:
	li	a0, 16
	call	allocate
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	lw	a1, -24(s0)
	bne	a0, a1, testing_LBB0_12
	j	testing_LBB0_11
testing_LBB0_11:
testing_Lpcrel_hi9:
	auipc	a0, %pcrel_hi(testing_L.str.5)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi9)
	call	print
	call	halt_kernel
	j	testing_LBB0_12
testing_LBB0_12:
	li	a0, 4
	call	allocate
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	lw	a1, -24(s0)
	beq	a0, a1, testing_LBB0_14
	j	testing_LBB0_13
testing_LBB0_13:
testing_Lpcrel_hi10:
	auipc	a0, %pcrel_hi(testing_L.str.6)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi10)
	call	print
	call	halt_kernel
	j	testing_LBB0_14
testing_LBB0_14:
testing_Lpcrel_hi11:
	auipc	a0, %pcrel_hi(testing_L.str.7)
	addi	a0, a0, %pcrel_lo(testing_Lpcrel_hi11)
	call	print
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
testing_Lfunc_end0:
	.size	heap_test, testing_Lfunc_end0-heap_test
                                        # -- End function
	.type	testing_L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
testing_L.str:
	.asciz	"[heap_test:] Allocation failed for ptr1\n"
	.size	testing_L.str, 41

	.type	testing_L.str.1,@object                # @.str.1
testing_L.str.1:
	.asciz	"[heap_test:] Heap limit did not increase correctly after ptr1 allocation\n"
	.size	testing_L.str.1, 74

	.type	testing_L.str.2,@object                # @.str.2
testing_L.str.2:
	.asciz	"[heap_test:] Allocation failed for ptr2\n"
	.size	testing_L.str.2, 41

	.type	testing_L.str.3,@object                # @.str.3
testing_L.str.3:
	.asciz	"[heap_test:] Heap limit did not increase correctly after ptr2 allocation\n"
	.size	testing_L.str.3, 74

	.type	testing_L.str.4,@object                # @.str.4
testing_L.str.4:
	.asciz	"[heap_test:] Deallocation did not mark ptr1 as free\n"
	.size	testing_L.str.4, 53

	.type	testing_L.str.5,@object                # @.str.5
testing_L.str.5:
	.asciz	"[heap_test:] Allocation reused freed space for ptr3 when it shouldn't have\n"
	.size	testing_L.str.5, 76

	.type	testing_L.str.6,@object                # @.str.6
testing_L.str.6:
	.asciz	"[heap_test:] Allocation did not reuse freed space for ptr3\n"
	.size	testing_L.str.6, 60

	.type	testing_L.str.7,@object                # @.str.7
testing_L.str.7:
	.asciz	"[heap_test:] All tests passed\n"
	.size	testing_L.str.7, 31

	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym heap_init
	.addrsig_sym allocate
	.addrsig_sym print
	.addrsig_sym halt_kernel
	.addrsig_sym deallocate
	.addrsig_sym heap_limit
