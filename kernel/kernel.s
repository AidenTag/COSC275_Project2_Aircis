	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_zmmul1p0"
	.file	"kernel.c"
	.globl	cpu_scheduler                   # -- Begin function cpu_scheduler
	.p2align	2
	.type	cpu_scheduler,@function
cpu_scheduler:                          # @cpu_scheduler
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	li	a0, 20
	call	set_alarm
kernel_Lpcrel_hi0:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi0)
	lw	a0, 0(a0)
kernel_Lpcrel_hi1:
	auipc	a1, %pcrel_hi(preserved_sp)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi1)
	lw	a1, 0(a1)
kernel_Lpcrel_hi2:
	auipc	a2, %pcrel_hi(user_base)
	addi	a2, a2, %pcrel_lo(kernel_Lpcrel_hi2)
	lw	a2, 0(a2)
kernel_Lpcrel_hi3:
	auipc	a3, %pcrel_hi(user_limit)
	addi	a3, a3, %pcrel_lo(kernel_Lpcrel_hi3)
	lw	a3, 0(a3)
	call	userspace_jump
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end0:
	.size	cpu_scheduler, kernel_Lfunc_end0-cpu_scheduler
                                        # -- End function
	.globl	add_process                     # -- Begin function add_process
	.p2align	2
	.type	add_process,@function
add_process:                            # @add_process
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -16(s0)
kernel_Lpcrel_hi4:
	auipc	a0, %pcrel_hi(ROM_device_code)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi4)
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	call	find_device
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	bnez	a0, kernel_LBB1_2
	j	kernel_LBB1_1
kernel_LBB1_1:
kernel_Lpcrel_hi5:
	auipc	a0, %pcrel_hi(kernel_L.str)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi5)
	call	print
	li	a0, -1
	sw	a0, -12(s0)
	j	kernel_LBB1_12
kernel_LBB1_2:
	li	a0, 24
	call	allocate
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	bnez	a0, kernel_LBB1_4
	j	kernel_LBB1_3
kernel_LBB1_3:
kernel_Lpcrel_hi6:
	auipc	a0, %pcrel_hi(kernel_L.str.1)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi6)
	call	print
	lw	a0, -16(s0)
	call	print_dec
kernel_Lpcrel_hi7:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi7)
	call	print
	li	a0, -2
	sw	a0, -12(s0)
	j	kernel_LBB1_12
kernel_LBB1_4:
	call	mm_allocate
	sw	a0, -28(s0)
	lw	a0, -28(s0)
	bnez	a0, kernel_LBB1_6
	j	kernel_LBB1_5
kernel_LBB1_5:
	lw	a0, -24(s0)
	call	deallocate
kernel_Lpcrel_hi8:
	auipc	a0, %pcrel_hi(kernel_L.str.3)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi8)
	call	print
	lw	a0, -16(s0)
	call	print_dec
kernel_Lpcrel_hi9:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi9)
	call	print
	li	a0, -3
	sw	a0, -12(s0)
	j	kernel_LBB1_12
kernel_LBB1_6:
	lw	a1, -20(s0)
	lw	a0, 8(a1)
	lw	a1, 4(a1)
	sub	a0, a0, a1
	sw	a0, -32(s0)
	lw	a0, -32(s0)
	lui	a1, 8
	addi	a1, a1, 1
	bltu	a0, a1, kernel_LBB1_8
	j	kernel_LBB1_7
kernel_LBB1_7:
	lw	a0, -24(s0)
	call	deallocate
	lw	a0, -28(s0)
	call	mm_deallocate
kernel_Lpcrel_hi10:
	auipc	a0, %pcrel_hi(kernel_L.str.4)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi10)
	call	print
	lw	a0, -16(s0)
	call	print_dec
kernel_Lpcrel_hi11:
	auipc	a0, %pcrel_hi(kernel_L.str.5)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi11)
	call	print
	li	a0, -4
	sw	a0, -12(s0)
	j	kernel_LBB1_12
kernel_LBB1_8:
	lw	a0, -20(s0)
	lw	a0, 4(a0)
kernel_Lpcrel_hi12:
	auipc	a1, %pcrel_hi(DMA_portal_ptr)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi12)
	lw	a2, 0(a1)
	sw	a0, 0(a2)
	lw	a0, -28(s0)
	lw	a2, 0(a1)
	sw	a0, 4(a2)
	lw	a0, -32(s0)
	lw	a1, 0(a1)
	sw	a0, 8(a1)
	lw	a1, -24(s0)
	li	a0, 0
	sw	a0, 0(a1)
	lw	a0, -24(s0)
	lui	a1, 8
	sw	a1, 4(a0)
	lw	a0, -28(s0)
	lw	a2, -24(s0)
	sw	a0, 8(a2)
	lw	a0, -28(s0)
	add	a0, a0, a1
	lw	a1, -24(s0)
	sw	a0, 12(a1)
kernel_Lpcrel_hi13:
	auipc	a0, %pcrel_hi(next_id)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi13)
	lw	a0, 0(a0)
	lw	a1, -24(s0)
	sw	a0, 16(a1)
kernel_Lpcrel_hi14:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi14)
	lw	a0, 0(a0)
	bnez	a0, kernel_LBB1_10
	j	kernel_LBB1_9
kernel_LBB1_9:
	lw	a0, -24(s0)
	sw	a0, 20(a0)
	lw	a0, -24(s0)
kernel_Lpcrel_hi15:
	auipc	a1, %pcrel_hi(current_process)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi15)
	sw	a0, 0(a1)
	j	kernel_LBB1_11
kernel_LBB1_10:
kernel_Lpcrel_hi16:
	auipc	a0, %pcrel_hi(current_process)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi16)
	lw	a0, 0(a1)
	lw	a0, 20(a0)
	lw	a2, -24(s0)
	sw	a0, 20(a2)
	lw	a0, -24(s0)
	lw	a1, 0(a1)
	sw	a0, 20(a1)
	j	kernel_LBB1_11
kernel_LBB1_11:
kernel_Lpcrel_hi17:
	auipc	a0, %pcrel_hi(next_id)
	addi	a2, a0, %pcrel_lo(kernel_Lpcrel_hi17)
	lw	a0, 0(a2)
	addi	a1, a0, 1
	sw	a1, 0(a2)
	sw	a0, -12(s0)
	j	kernel_LBB1_12
kernel_LBB1_12:
	lw	a0, -12(s0)
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
kernel_Lfunc_end1:
	.size	add_process, kernel_Lfunc_end1-add_process
                                        # -- End function
	.globl	do_run                          # -- Begin function do_run
	.p2align	2
	.type	do_run,@function
do_run:                                 # @do_run
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -16(s0)
kernel_Lpcrel_hi18:
	auipc	a0, %pcrel_hi(kernel_L.str.6)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi18)
	call	print
kernel_Lpcrel_hi19:
	auipc	a0, %pcrel_hi(kernel_L.str.7)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi19)
	call	print
	lw	a0, -16(s0)
	call	print_dec
kernel_Lpcrel_hi20:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi20)
	call	print
kernel_Lpcrel_hi21:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi21)
	lw	a0, 0(a1)
	addi	a0, a0, 4
	sw	a0, 0(a1)
	lw	a1, -16(s0)
	li	a0, 3
	blt	a0, a1, kernel_LBB2_2
	j	kernel_LBB2_1
kernel_LBB2_1:
kernel_Lpcrel_hi22:
	auipc	a0, %pcrel_hi(kernel_L.str)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi22)
	call	print
	li	a0, -1
	sw	a0, -12(s0)
	j	kernel_LBB2_3
kernel_LBB2_2:
	lw	a0, -16(s0)
	call	add_process
	sw	a0, -12(s0)
	j	kernel_LBB2_3
kernel_LBB2_3:
	lw	a0, -12(s0)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end2:
	.size	do_run, kernel_Lfunc_end2-do_run
                                        # -- End function
	.globl	run_next                        # -- Begin function run_next
	.p2align	2
	.type	run_next,@function
run_next:                               # @run_next
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
kernel_Lpcrel_hi23:
	auipc	a0, %pcrel_hi(kernel_L.str.7)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi23)
	call	print
kernel_Lpcrel_hi24:
	auipc	a0, %pcrel_hi(next_ROM_number)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi24)
	sw	a0, -16(s0)                     # 4-byte Folded Spill
	lw	a0, 0(a0)
	call	print_dec
kernel_Lpcrel_hi25:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi25)
	call	print
	lw	a1, -16(s0)                     # 4-byte Folded Reload
kernel_Lpcrel_hi26:
	auipc	a0, %pcrel_hi(ROM_device_code)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi26)
	lw	a0, 0(a0)
	lw	a1, 0(a1)
	call	find_device
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	bnez	a0, kernel_LBB3_2
	j	kernel_LBB3_1
kernel_LBB3_1:
kernel_Lpcrel_hi27:
	auipc	a0, %pcrel_hi(kernel_L.str.8)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi27)
	call	print
	j	kernel_LBB3_3
kernel_LBB3_2:
	lw	a0, -12(s0)
	lw	a0, 4(a0)
kernel_Lpcrel_hi28:
	auipc	a1, %pcrel_hi(DMA_portal_ptr)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi28)
	lw	a2, 0(a1)
	sw	a0, 0(a2)
kernel_Lpcrel_hi29:
	auipc	a0, %pcrel_hi(user_base)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi29)
	lw	a0, 0(a0)
	lw	a2, 0(a1)
	sw	a0, 4(a2)
	lw	a2, -12(s0)
	lw	a0, 8(a2)
	lw	a2, 4(a2)
	sub	a0, a0, a2
	lw	a1, 0(a1)
	sw	a0, 8(a1)
kernel_Lpcrel_hi30:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi30)
	li	a0, 0
	sw	a0, 0(a1)
kernel_Lpcrel_hi31:
	auipc	a0, %pcrel_hi(user_size)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi31)
	lw	a0, 0(a0)
kernel_Lpcrel_hi32:
	auipc	a1, %pcrel_hi(preserved_sp)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi32)
	sw	a0, 0(a1)
kernel_Lpcrel_hi33:
	auipc	a0, %pcrel_hi(next_ROM_number)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi33)
	lw	a0, 0(a1)
	addi	a0, a0, 1
	sw	a0, 0(a1)
	call	cpu_scheduler
	j	kernel_LBB3_3
kernel_LBB3_3:
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end3:
	.size	run_next, kernel_Lfunc_end3-run_next
                                        # -- End function
	.globl	do_noop                         # -- Begin function do_noop
	.p2align	2
	.type	do_noop,@function
do_noop:                                # @do_noop
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
kernel_Lpcrel_hi34:
	auipc	a0, %pcrel_hi(kernel_L.str.9)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi34)
	call	print
kernel_Lpcrel_hi35:
	auipc	a0, %pcrel_hi(kernel_L.str.10)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi35)
	call	print
kernel_Lpcrel_hi36:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi36)
	call	print
kernel_Lpcrel_hi37:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi37)
	lw	a0, 0(a1)
	addi	a0, a0, 4
	sw	a0, 0(a1)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end4:
	.size	do_noop, kernel_Lfunc_end4-do_noop
                                        # -- End function
	.globl	do_exit                         # -- Begin function do_exit
	.p2align	2
	.type	do_exit,@function
do_exit:                                # @do_exit
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -12(s0)
kernel_Lpcrel_hi38:
	auipc	a0, %pcrel_hi(kernel_L.str.11)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi38)
	call	print
	lw	a0, -12(s0)
	call	print_dec
kernel_Lpcrel_hi39:
	auipc	a0, %pcrel_hi(kernel_L.str.2)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi39)
	call	print
kernel_Lpcrel_hi40:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi40)
	lw	a0, 0(a0)
	sw	a0, -16(s0)
	lw	a1, -16(s0)
	lw	a0, 20(a1)
	bne	a0, a1, kernel_LBB5_2
	j	kernel_LBB5_1
kernel_LBB5_1:
kernel_Lpcrel_hi41:
	auipc	a0, %pcrel_hi(kernel_L.str.12)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi41)
	call	print
	lw	a0, -16(s0)
	lw	a0, 8(a0)
	call	mm_deallocate
	lw	a0, -16(s0)
	call	deallocate
kernel_Lpcrel_hi42:
	auipc	a0, %pcrel_hi(current_process)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi42)
	li	a0, 0
	sw	a0, 0(a1)
	j	kernel_LBB5_9
kernel_LBB5_2:
	j	kernel_LBB5_3
kernel_LBB5_3:                                # =>This Inner Loop Header: Depth=1
kernel_Lpcrel_hi43:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi43)
	lw	a0, 0(a0)
	lw	a0, 20(a0)
	lw	a1, -16(s0)
	beq	a0, a1, kernel_LBB5_5
	j	kernel_LBB5_4
kernel_LBB5_4:                                #   in Loop: Header=BB5_3 Depth=1
kernel_Lpcrel_hi44:
	auipc	a0, %pcrel_hi(current_process)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi44)
	lw	a0, 0(a1)
	lw	a0, 20(a0)
	sw	a0, 0(a1)
	j	kernel_LBB5_3
kernel_LBB5_5:
	lw	a0, -16(s0)
	lw	a1, 20(a0)
kernel_Lpcrel_hi45:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi45)
	lw	a2, 0(a0)
	sw	a1, 20(a2)
	lw	a1, 0(a0)
	lw	a1, 20(a1)
	sw	a1, 0(a0)
	lw	a0, 0(a0)
	lw	a1, -16(s0)
	lw	a1, 20(a1)
	beq	a0, a1, kernel_LBB5_7
	j	kernel_LBB5_6
kernel_LBB5_6:
kernel_Lpcrel_hi46:
	auipc	a0, %pcrel_hi(kernel_L.str.13)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi46)
	call	print
	call	halt_kernel
	j	kernel_LBB5_8
kernel_LBB5_7:
kernel_Lpcrel_hi47:
	auipc	a0, %pcrel_hi(kernel_L.str.14)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi47)
	call	print
	j	kernel_LBB5_8
kernel_LBB5_8:
	lw	a0, -16(s0)
	lw	a0, 8(a0)
	call	mm_deallocate
	lw	a0, -16(s0)
	call	deallocate
kernel_Lpcrel_hi48:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi48)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
kernel_Lpcrel_hi49:
	auipc	a2, %pcrel_hi(preserved_epc)
	addi	a2, a2, %pcrel_lo(kernel_Lpcrel_hi49)
	sw	a1, 0(a2)
	lw	a1, 0(a0)
	lw	a1, 4(a1)
kernel_Lpcrel_hi50:
	auipc	a2, %pcrel_hi(preserved_sp)
	addi	a2, a2, %pcrel_lo(kernel_Lpcrel_hi50)
	sw	a1, 0(a2)
	lw	a1, 0(a0)
	lw	a1, 8(a1)
kernel_Lpcrel_hi51:
	auipc	a2, %pcrel_hi(user_base)
	addi	a2, a2, %pcrel_lo(kernel_Lpcrel_hi51)
	sw	a1, 0(a2)
	lw	a0, 0(a0)
	lw	a0, 12(a0)
kernel_Lpcrel_hi52:
	auipc	a1, %pcrel_hi(user_limit)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi52)
	sw	a0, 0(a1)
	call	cpu_scheduler
	j	kernel_LBB5_9
kernel_LBB5_9:
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end5:
	.size	do_exit, kernel_Lfunc_end5-do_exit
                                        # -- End function
	.globl	do_print                        # -- Begin function do_print
	.p2align	2
	.type	do_print,@function
do_print:                               # @do_print
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -16(s0)
	lw	a0, -16(s0)
kernel_Lpcrel_hi53:
	auipc	a1, %pcrel_hi(user_base)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi53)
	lw	a1, 0(a1)
	add	a0, a0, a1
	sw	a0, -16(s0)
	lw	a0, -16(s0)
kernel_Lpcrel_hi54:
	auipc	a1, %pcrel_hi(user_limit)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi54)
	lw	a1, 0(a1)
	bltu	a0, a1, kernel_LBB6_2
	j	kernel_LBB6_1
kernel_LBB6_1:
	li	a0, -1
	sw	a0, -12(s0)
	j	kernel_LBB6_3
kernel_LBB6_2:
	lw	a0, -16(s0)
	call	print
kernel_Lpcrel_hi55:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a1, a0, %pcrel_lo(kernel_Lpcrel_hi55)
	lw	a0, 0(a1)
	addi	a0, a0, 4
	sw	a0, 0(a1)
	li	a0, 0
	sw	a0, -12(s0)
	j	kernel_LBB6_3
kernel_LBB6_3:
	lw	a0, -12(s0)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end6:
	.size	do_print, kernel_Lfunc_end6-do_print
                                        # -- End function
	.globl	do_syscall                      # -- Begin function do_syscall
	.p2align	2
	.type	do_syscall,@function
do_syscall:                             # @do_syscall
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	li	a0, 0
	sb	a0, -17(s0)
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	lui	a1, 827664
	bne	a0, a1, kernel_LBB7_2
	j	kernel_LBB7_1
kernel_LBB7_1:
	call	do_noop
	j	kernel_LBB7_12
kernel_LBB7_2:
	lw	a0, -12(s0)
	lui	a1, 827664
	addi	a1, a1, 1
	bne	a0, a1, kernel_LBB7_4
	j	kernel_LBB7_3
kernel_LBB7_3:
	lw	a0, -16(s0)
	call	do_exit
kernel_Lpcrel_hi56:
	auipc	a0, %pcrel_hi(kernel_L.str.15)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi56)
	call	print
	call	halt_kernel
	j	kernel_LBB7_11
kernel_LBB7_4:
	lw	a0, -12(s0)
	lui	a1, 827664
	addi	a1, a1, 2
	bne	a0, a1, kernel_LBB7_6
	j	kernel_LBB7_5
kernel_LBB7_5:
	li	a0, 1
	sb	a0, -17(s0)
	lw	a0, -16(s0)
	call	do_print
	sw	a0, -24(s0)
	j	kernel_LBB7_10
kernel_LBB7_6:
	lw	a0, -12(s0)
	lui	a1, 827664
	addi	a1, a1, 3
	bne	a0, a1, kernel_LBB7_8
	j	kernel_LBB7_7
kernel_LBB7_7:
	li	a0, 1
	sb	a0, -17(s0)
	lw	a0, -16(s0)
	call	do_run
	sw	a0, -24(s0)
	j	kernel_LBB7_9
kernel_LBB7_8:
	li	a0, -1
	sw	a0, -24(s0)
	j	kernel_LBB7_9
kernel_LBB7_9:
	j	kernel_LBB7_10
kernel_LBB7_10:
	j	kernel_LBB7_11
kernel_LBB7_11:
	j	kernel_LBB7_12
kernel_LBB7_12:
	lbu	a0, -17(s0)
	andi	a0, a0, 1
	beqz	a0, kernel_LBB7_14
	j	kernel_LBB7_13
kernel_LBB7_13:
kernel_Lpcrel_hi57:
	auipc	a0, %pcrel_hi(user_base)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi57)
	lw	a0, 0(a0)
kernel_Lpcrel_hi58:
	auipc	a1, %pcrel_hi(preserved_sp)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi58)
	lw	a1, 0(a1)
	add	a0, a0, a1
	addi	a0, a0, -36
	sw	a0, -28(s0)
	lw	a0, -24(s0)
	lw	a1, -28(s0)
	sw	a0, 0(a1)
	j	kernel_LBB7_14
kernel_LBB7_14:
	call	cpu_scheduler
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
kernel_Lfunc_end7:
	.size	do_syscall, kernel_Lfunc_end7-do_syscall
                                        # -- End function
	.globl	do_alarm                        # -- Begin function do_alarm
	.p2align	2
	.type	do_alarm,@function
do_alarm:                               # @do_alarm
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
kernel_Lpcrel_hi59:
	auipc	a0, %pcrel_hi(kernel_L.str.16)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi59)
	call	print
kernel_Lpcrel_hi60:
	auipc	a0, %pcrel_hi(preserved_epc)
	addi	a3, a0, %pcrel_lo(kernel_Lpcrel_hi60)
	lw	a1, 0(a3)
kernel_Lpcrel_hi61:
	auipc	a0, %pcrel_hi(current_process)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi61)
	lw	a2, 0(a0)
	sw	a1, 0(a2)
kernel_Lpcrel_hi62:
	auipc	a1, %pcrel_hi(preserved_sp)
	addi	a2, a1, %pcrel_lo(kernel_Lpcrel_hi62)
	lw	a1, 0(a2)
	lw	a4, 0(a0)
	sw	a1, 4(a4)
	lw	a1, 0(a0)
	lw	a1, 20(a1)
	sw	a1, 0(a0)
	lw	a1, 0(a0)
	lw	a1, 0(a1)
	sw	a1, 0(a3)
	lw	a1, 0(a0)
	lw	a1, 4(a1)
	sw	a1, 0(a2)
	lw	a1, 0(a0)
	lw	a1, 8(a1)
kernel_Lpcrel_hi63:
	auipc	a2, %pcrel_hi(user_base)
	addi	a2, a2, %pcrel_lo(kernel_Lpcrel_hi63)
	sw	a1, 0(a2)
	lw	a0, 0(a0)
	lw	a0, 12(a0)
kernel_Lpcrel_hi64:
	auipc	a1, %pcrel_hi(user_limit)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi64)
	sw	a0, 0(a1)
	call	cpu_scheduler
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end8:
	.size	do_alarm, kernel_Lfunc_end8-do_alarm
                                        # -- End function
	.globl	run_init                        # -- Begin function run_init
	.p2align	2
	.type	run_init,@function
run_init:                               # @run_init
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	li	a0, 3
	call	add_process
	sw	a0, -12(s0)
kernel_Lpcrel_hi65:
	auipc	a0, %pcrel_hi(kernel_limit)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi65)
	lw	a0, 0(a0)
kernel_Lpcrel_hi66:
	auipc	a1, %pcrel_hi(user_base)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi66)
	sw	a0, 0(a1)
kernel_Lpcrel_hi67:
	auipc	a0, %pcrel_hi(RAM_limit)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi67)
	lw	a2, 0(a0)
kernel_Lpcrel_hi68:
	auipc	a0, %pcrel_hi(user_limit)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi68)
	sw	a2, 0(a0)
	lw	a0, 0(a0)
	lw	a1, 0(a1)
	sub	a0, a0, a1
kernel_Lpcrel_hi69:
	auipc	a1, %pcrel_hi(user_size)
	addi	a1, a1, %pcrel_lo(kernel_Lpcrel_hi69)
	sw	a0, 0(a1)
	call	run_next
kernel_Lpcrel_hi70:
	auipc	a0, %pcrel_hi(kernel_L.str.17)
	addi	a0, a0, %pcrel_lo(kernel_Lpcrel_hi70)
	call	print
	call	halt_kernel
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
kernel_Lfunc_end9:
	.size	run_init, kernel_Lfunc_end9-run_init
                                        # -- End function
	.type	next_ROM_number,@object         # @next_ROM_number
	.section	.sdata,"aw",@progbits
	.globl	next_ROM_number
	.p2align	2, 0x0
next_ROM_number:
	.word	3                               # 0x3
	.size	next_ROM_number, 4

	.type	user_base,@object               # @user_base
	.section	.sbss,"aw",@nobits
	.globl	user_base
	.p2align	2, 0x0
user_base:
	.word	0                               # 0x0
	.size	user_base, 4

	.type	user_limit,@object              # @user_limit
	.globl	user_limit
	.p2align	2, 0x0
user_limit:
	.word	0                               # 0x0
	.size	user_limit, 4

	.type	user_size,@object               # @user_size
	.globl	user_size
	.p2align	2, 0x0
user_size:
	.word	0                               # 0x0
	.size	user_size, 4

	.type	next_id,@object                 # @next_id
	.globl	next_id
	.p2align	2, 0x0
next_id:
	.word	0                               # 0x0
	.size	next_id, 4

	.type	current_process,@object         # @current_process
	.globl	current_process
	.p2align	2, 0x0
current_process:
	.word	0
	.size	current_process, 4

	.type	kernel_L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
kernel_L.str:
	.asciz	"[kernel:] Invalid ROM number\n"
	.size	kernel_L.str, 30

	.type	kernel_L.str.1,@object                # @.str.1
kernel_L.str.1:
	.asciz	"[kernel:] Process allocation failed for ROM #"
	.size	kernel_L.str.1, 46

	.type	kernel_L.str.2,@object                # @.str.2
kernel_L.str.2:
	.asciz	"\n"
	.size	kernel_L.str.2, 2

	.type	kernel_L.str.3,@object                # @.str.3
kernel_L.str.3:
	.asciz	"[kernel:] Main memory allocation failed for ROM #"
	.size	kernel_L.str.3, 50

	.type	kernel_L.str.4,@object                # @.str.4
kernel_L.str.4:
	.asciz	"[kernel:] ROM #"
	.size	kernel_L.str.4, 16

	.type	kernel_L.str.5,@object                # @.str.5
kernel_L.str.5:
	.asciz	" is too large to fit in main memory\n"
	.size	kernel_L.str.5, 37

	.type	kernel_L.str.6,@object                # @.str.6
kernel_L.str.6:
	.asciz	"[kernel:] RUN interrupt caught\n"
	.size	kernel_L.str.6, 32

	.type	kernel_L.str.7,@object                # @.str.7
kernel_L.str.7:
	.asciz	"[kernel:] RUN ROM #"
	.size	kernel_L.str.7, 20

	.type	kernel_L.str.8,@object                # @.str.8
kernel_L.str.8:
	.asciz	"[kernel:] invalid ROM_ptr"
	.size	kernel_L.str.8, 26

	.type	kernel_L.str.9,@object                # @.str.9
kernel_L.str.9:
	.asciz	"[debug: ] "
	.size	kernel_L.str.9, 11

	.type	kernel_L.str.10,@object               # @.str.10
kernel_L.str.10:
	.asciz	"NOOP requested"
	.size	kernel_L.str.10, 15

	.type	kernel_L.str.11,@object               # @.str.11
kernel_L.str.11:
	.asciz	"[kernel:] EXIT process with status "
	.size	kernel_L.str.11, 36

	.type	kernel_L.str.12,@object               # @.str.12
kernel_L.str.12:
	.asciz	"[kernel:] completed all processes. \n"
	.size	kernel_L.str.12, 37

	.type	kernel_L.str.13,@object               # @.str.13
kernel_L.str.13:
	.asciz	"[kernel:] unlink failed\n"
	.size	kernel_L.str.13, 25

	.type	kernel_L.str.14,@object               # @.str.14
kernel_L.str.14:
	.asciz	"[kernel:] unlink worked!\n"
	.size	kernel_L.str.14, 26

	.type	kernel_L.str.15,@object               # @.str.15
kernel_L.str.15:
	.asciz	"[kernel:] All processes terminated\n"
	.size	kernel_L.str.15, 36

	.type	kernel_L.str.16,@object               # @.str.16
kernel_L.str.16:
	.asciz	"[kernel:] ALARM interrupt caught\n"
	.size	kernel_L.str.16, 34

	.type	kernel_L.str.17,@object               # @.str.17
kernel_L.str.17:
	.asciz	"[kernel:] Failed to run, no user ROMs\n"
	.size	kernel_L.str.17, 39

	.ident	"clang version 19.1.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cpu_scheduler
	.addrsig_sym set_alarm
	.addrsig_sym userspace_jump
	.addrsig_sym add_process
	.addrsig_sym find_device
	.addrsig_sym print
	.addrsig_sym allocate
	.addrsig_sym print_dec
	.addrsig_sym mm_allocate
	.addrsig_sym deallocate
	.addrsig_sym mm_deallocate
	.addrsig_sym do_run
	.addrsig_sym run_next
	.addrsig_sym do_noop
	.addrsig_sym do_exit
	.addrsig_sym halt_kernel
	.addrsig_sym do_print
	.addrsig_sym next_ROM_number
	.addrsig_sym user_base
	.addrsig_sym user_limit
	.addrsig_sym user_size
	.addrsig_sym next_id
	.addrsig_sym current_process
	.addrsig_sym preserved_epc
	.addrsig_sym preserved_sp
	.addrsig_sym ROM_device_code
	.addrsig_sym DMA_portal_ptr
	.addrsig_sym kernel_limit
	.addrsig_sym RAM_limit
