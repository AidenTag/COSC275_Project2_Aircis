	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_zmmul1p0"
	.file	"heap_alloc.c"
	.globl	heap_init                       # -- Begin function heap_init
	.p2align	2
	.type	heap_init,@function
heap_init:                              # @heap_init
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
heap_alloc_Lpcrel_hi0:
	auipc	a0, %pcrel_hi(heap_limit)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi0)
	lw	a0, 0(a0)
	beqz	a0, heap_alloc_LBB0_2
	j	heap_alloc_LBB0_1
heap_alloc_LBB0_1:
	j	heap_alloc_LBB0_6
heap_alloc_LBB0_2:
heap_alloc_Lpcrel_hi1:
	auipc	a0, %pcrel_hi(statics_limit)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi1)
	andi	a0, a0, 3
	bnez	a0, heap_alloc_LBB0_4
	j	heap_alloc_LBB0_3
heap_alloc_LBB0_3:
heap_alloc_Lpcrel_hi2:
	auipc	a0, %pcrel_hi(statics_limit)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi2)
	sw	a0, -12(s0)                     # 4-byte Folded Spill
	j	heap_alloc_LBB0_5
heap_alloc_LBB0_4:
heap_alloc_Lpcrel_hi3:
	auipc	a0, %pcrel_hi(statics_limit)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi3)
	addi	a0, a0, 4
	andi	a0, a0, -4
	sw	a0, -12(s0)                     # 4-byte Folded Spill
	j	heap_alloc_LBB0_5
heap_alloc_LBB0_5:
	lw	a1, -12(s0)                     # 4-byte Folded Reload
heap_alloc_Lpcrel_hi4:
	auipc	a0, %pcrel_hi(heap_start)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi4)
	sw	a1, 0(a0)
	lw	a0, 0(a0)
heap_alloc_Lpcrel_hi5:
	auipc	a1, %pcrel_hi(heap_limit)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi5)
	sw	a0, 0(a1)
	j	heap_alloc_LBB0_6
heap_alloc_LBB0_6:
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
heap_alloc_Lfunc_end0:
	.size	heap_init, heap_alloc_Lfunc_end0-heap_init
                                        # -- End function
	.globl	allocate                        # -- Begin function allocate
	.p2align	2
	.type	allocate,@function
allocate:                               # @allocate
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 48
	sw	a0, -12(s0)
heap_alloc_Lpcrel_hi6:
	auipc	a0, %pcrel_hi(heap_alloc_L.str)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi6)
	call	print
	lw	a0, -12(s0)
	call	print_dec
heap_alloc_Lpcrel_hi7:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.1)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi7)
	call	print
	call	heap_init
	li	a0, 0
	sw	a0, -16(s0)
heap_alloc_Lpcrel_hi8:
	auipc	a1, %pcrel_hi(heap_start)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi8)
	lw	a1, 0(a1)
	sw	a1, -20(s0)
	lw	a1, -12(s0)
	bge	a0, a1, heap_alloc_LBB1_17
	j	heap_alloc_LBB1_1
heap_alloc_LBB1_1:
	lbu	a0, -12(s0)
	andi	a0, a0, 3
	bnez	a0, heap_alloc_LBB1_3
	j	heap_alloc_LBB1_2
heap_alloc_LBB1_2:
	lw	a0, -12(s0)
	sw	a0, -36(s0)                     # 4-byte Folded Spill
	j	heap_alloc_LBB1_4
heap_alloc_LBB1_3:
	lw	a0, -12(s0)
	addi	a0, a0, 4
	andi	a0, a0, -4
	sw	a0, -36(s0)                     # 4-byte Folded Spill
	j	heap_alloc_LBB1_4
heap_alloc_LBB1_4:
	lw	a0, -36(s0)                     # 4-byte Folded Reload
	sw	a0, -24(s0)
	j	heap_alloc_LBB1_5
heap_alloc_LBB1_5:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -20(s0)
heap_alloc_Lpcrel_hi9:
	auipc	a1, %pcrel_hi(heap_limit)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi9)
	lw	a1, 0(a1)
	bgeu	a0, a1, heap_alloc_LBB1_11
	j	heap_alloc_LBB1_6
heap_alloc_LBB1_6:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -20(s0)
	lw	a0, 0(a0)
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	sw	a0, -32(s0)
	lw	a0, -28(s0)
	bgez	a0, heap_alloc_LBB1_10
	j	heap_alloc_LBB1_7
heap_alloc_LBB1_7:                                #   in Loop: Header=BB1_5 Depth=1
	lw	a1, -28(s0)
	li	a0, 0
	sub	a0, a0, a1
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	lw	a1, -24(s0)
	blt	a0, a1, heap_alloc_LBB1_9
	j	heap_alloc_LBB1_8
heap_alloc_LBB1_8:
	j	heap_alloc_LBB1_11
heap_alloc_LBB1_9:                                #   in Loop: Header=BB1_5 Depth=1
	j	heap_alloc_LBB1_10
heap_alloc_LBB1_10:                               #   in Loop: Header=BB1_5 Depth=1
	lw	a0, -32(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	addi	a0, a0, 4
	sw	a0, -20(s0)
	j	heap_alloc_LBB1_5
heap_alloc_LBB1_11:
	lw	a0, -20(s0)
heap_alloc_Lpcrel_hi10:
	auipc	a1, %pcrel_hi(heap_limit)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi10)
	lw	a1, 0(a1)
	bgeu	a0, a1, heap_alloc_LBB1_13
	j	heap_alloc_LBB1_12
heap_alloc_LBB1_12:
	lw	a0, -20(s0)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	lw	a1, -20(s0)
	lw	a2, 0(a1)
	li	a0, 0
	sub	a0, a0, a2
	sw	a0, 0(a1)
	j	heap_alloc_LBB1_16
heap_alloc_LBB1_13:
heap_alloc_Lpcrel_hi11:
	auipc	a0, %pcrel_hi(kernel_limit)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi11)
	lw	a0, 0(a0)
heap_alloc_Lpcrel_hi12:
	auipc	a1, %pcrel_hi(heap_limit)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi12)
	lw	a1, 0(a1)
	sub	a0, a0, a1
	lw	a1, -24(s0)
	addi	a1, a1, 4
	bltu	a0, a1, heap_alloc_LBB1_15
	j	heap_alloc_LBB1_14
heap_alloc_LBB1_14:
	lw	a0, -24(s0)
heap_alloc_Lpcrel_hi13:
	auipc	a1, %pcrel_hi(heap_limit)
	addi	a1, a1, %pcrel_lo(heap_alloc_Lpcrel_hi13)
	lw	a2, 0(a1)
	sw	a0, 0(a2)
	lw	a0, 0(a1)
	addi	a0, a0, 4
	sw	a0, -16(s0)
	lw	a0, -24(s0)
	lw	a2, 0(a1)
	add	a0, a0, a2
	addi	a0, a0, 4
	sw	a0, 0(a1)
	j	heap_alloc_LBB1_15
heap_alloc_LBB1_15:
	j	heap_alloc_LBB1_16
heap_alloc_LBB1_16:
	j	heap_alloc_LBB1_17
heap_alloc_LBB1_17:
	lw	a0, -16(s0)
	call	print_hex
heap_alloc_Lpcrel_hi14:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.2)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi14)
	call	print
	lw	a0, -16(s0)
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
heap_alloc_Lfunc_end1:
	.size	allocate, heap_alloc_Lfunc_end1-allocate
                                        # -- End function
	.globl	deallocate                      # -- Begin function deallocate
	.p2align	2
	.type	deallocate,@function
deallocate:                             # @deallocate
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	bnez	a0, heap_alloc_LBB2_2
	j	heap_alloc_LBB2_1
heap_alloc_LBB2_1:
	j	heap_alloc_LBB2_8
heap_alloc_LBB2_2:
heap_alloc_Lpcrel_hi15:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.3)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi15)
	call	print
	lw	a0, -12(s0)
	call	print_hex
heap_alloc_Lpcrel_hi16:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.4)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi16)
	call	print
	lw	a0, -12(s0)
	addi	a0, a0, -4
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	lw	a1, 0(a0)
	li	a0, 0
	bge	a0, a1, heap_alloc_LBB2_4
	j	heap_alloc_LBB2_3
heap_alloc_LBB2_3:
	lw	a1, -16(s0)
	lw	a2, 0(a1)
	li	a0, 0
	sub	a0, a0, a2
	sw	a0, 0(a1)
	j	heap_alloc_LBB2_5
heap_alloc_LBB2_4:
heap_alloc_Lpcrel_hi17:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.5)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi17)
	call	print
	j	heap_alloc_LBB2_5
heap_alloc_LBB2_5:
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	lw	a0, 0(a0)
	bgez	a0, heap_alloc_LBB2_7
	j	heap_alloc_LBB2_6
heap_alloc_LBB2_6:
	lw	a0, -16(s0)
	lw	a1, 0(a0)
	li	a0, 0
	sub	a0, a0, a1
	sw	a0, -20(s0)
	j	heap_alloc_LBB2_7
heap_alloc_LBB2_7:
	lw	a0, -20(s0)
	call	print_dec
heap_alloc_Lpcrel_hi18:
	auipc	a0, %pcrel_hi(heap_alloc_L.str.6)
	addi	a0, a0, %pcrel_lo(heap_alloc_Lpcrel_hi18)
	call	print
	j	heap_alloc_LBB2_8
heap_alloc_LBB2_8:
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
heap_alloc_Lfunc_end2:
	.size	deallocate, heap_alloc_Lfunc_end2-deallocate
                                        # -- End function
	.type	heap_start,@object              # @heap_start
	.section	.sbss,"aw",@nobits
	.globl	heap_start
	.p2align	2, 0x0
heap_start:
	.word	0                               # 0x0
	.size	heap_start, 4

	.type	heap_limit,@object              # @heap_limit
	.globl	heap_limit
	.p2align	2, 0x0
heap_limit:
	.word	0                               # 0x0
	.size	heap_limit, 4

	.type	heap_alloc_L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
heap_alloc_L.str:
	.asciz	"[debug: ] allocate("
	.size	heap_alloc_L.str, 20

	.type	heap_alloc_L.str.1,@object                # @.str.1
heap_alloc_L.str.1:
	.asciz	") -> 0x"
	.size	heap_alloc_L.str.1, 8

	.type	heap_alloc_L.str.2,@object                # @.str.2
heap_alloc_L.str.2:
	.asciz	"\n"
	.size	heap_alloc_L.str.2, 2

	.type	heap_alloc_L.str.3,@object                # @.str.3
heap_alloc_L.str.3:
	.asciz	"[debug: ] deallocate(0x"
	.size	heap_alloc_L.str.3, 24

	.type	heap_alloc_L.str.4,@object                # @.str.4
heap_alloc_L.str.4:
	.asciz	") [size = "
	.size	heap_alloc_L.str.4, 11

	.type	heap_alloc_L.str.5,@object                # @.str.5
heap_alloc_L.str.5:
	.asciz	"\n Cannot deallocate deallocated block."
	.size	heap_alloc_L.str.5, 39

	.type	heap_alloc_L.str.6,@object                # @.str.6
heap_alloc_L.str.6:
	.asciz	"]\n"
	.size	heap_alloc_L.str.6, 3

	.ident	"clang version 19.1.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym heap_init
	.addrsig_sym print
	.addrsig_sym print_dec
	.addrsig_sym print_hex
	.addrsig_sym heap_start
	.addrsig_sym heap_limit
	.addrsig_sym statics_limit
	.addrsig_sym kernel_limit
