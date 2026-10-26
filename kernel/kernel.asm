	.Code
cpu_scheduler:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
	lui	a0, 1 
	addi	a0, a0, 904 
	call	set_alarm 
kernel_Lpcrel_hi0:
	auipc	a0, %hi(%pcrel(preserved_epc))
	addi	a0, a0, %lo(%larel(preserved_epc,kernel_Lpcrel_hi0))
	lw	a0, 0(a0) 
kernel_Lpcrel_hi1:
	auipc	a1, %hi(%pcrel(preserved_sp))
	addi	a1, a1, %lo(%larel(preserved_sp,kernel_Lpcrel_hi1))
	lw	a1, 0(a1) 
kernel_Lpcrel_hi2:
	auipc	a2, %hi(%pcrel(user_base))
	addi	a2, a2, %lo(%larel(user_base,kernel_Lpcrel_hi2))
	lw	a2, 0(a2) 
kernel_Lpcrel_hi3:
	auipc	a3, %hi(%pcrel(user_limit))
	addi	a3, a3, %lo(%larel(user_limit,kernel_Lpcrel_hi3))
	lw	a3, 0(a3) 
	call	userspace_jump 
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end0:
	#	-- End function 
do_run:
	#	%bb.0: 
	addi	sp, sp, -32 
	sw	ra, 28(sp) # 4-byte Folded Spill 
	sw	s0, 24(sp) # 4-byte Folded Spill 
	addi	s0, sp, 32 
	sw	a0, -16(s0) 
kernel_Lpcrel_hi4:
	auipc	a0, %hi(%pcrel(kernel_L.str))
	addi	a0, a0, %lo(%larel(kernel_L.str,kernel_Lpcrel_hi4))
	call	print 
	lw	a0, -16(s0) 
	call	print_dec 
kernel_Lpcrel_hi5:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi5))
	call	print 
kernel_Lpcrel_hi6:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi6))
	lw	a0, 0(a0) 
	beqz	a0, kernel_LBB1_3 
	j	kernel_LBB1_1 
kernel_LBB1_1:
	lw	a1, -16(s0) 
	li	a0, 3 
	blt	a0, a1, kernel_LBB1_3 
	j	kernel_LBB1_2 
kernel_LBB1_2:
kernel_Lpcrel_hi7:
	auipc	a0, %hi(%pcrel(kernel_L.str.2))
	addi	a0, a0, %lo(%larel(kernel_L.str.2,kernel_Lpcrel_hi7))
	call	print 
	li	a0, -1 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_3:
kernel_Lpcrel_hi8:
	auipc	a0, %hi(%pcrel(ROM_device_code))
	addi	a0, a0, %lo(%larel(ROM_device_code,kernel_Lpcrel_hi8))
	lw	a0, 0(a0) 
	lw	a1, -16(s0) 
	call	find_device 
	sw	a0, -20(s0) 
	lw	a0, -20(s0) 
	bnez	a0, kernel_LBB1_5 
	j	kernel_LBB1_4 
kernel_LBB1_4:
kernel_Lpcrel_hi9:
	auipc	a0, %hi(%pcrel(kernel_L.str.2))
	addi	a0, a0, %lo(%larel(kernel_L.str.2,kernel_Lpcrel_hi9))
	call	print 
	li	a0, -1 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_5:
	li	a0, 24 
	call	allocate 
	sw	a0, -24(s0) 
	lw	a0, -24(s0) 
	bnez	a0, kernel_LBB1_7 
	j	kernel_LBB1_6 
kernel_LBB1_6:
kernel_Lpcrel_hi10:
	auipc	a0, %hi(%pcrel(kernel_L.str.3))
	addi	a0, a0, %lo(%larel(kernel_L.str.3,kernel_Lpcrel_hi10))
	call	print 
	lw	a0, -16(s0) 
	call	print_dec 
kernel_Lpcrel_hi11:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi11))
	call	print 
	li	a0, -2 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_7:
	call	mm_allocate 
	sw	a0, -28(s0) 
	lw	a0, -28(s0) 
	bnez	a0, kernel_LBB1_9 
	j	kernel_LBB1_8 
kernel_LBB1_8:
	lw	a0, -24(s0) 
	call	deallocate 
kernel_Lpcrel_hi12:
	auipc	a0, %hi(%pcrel(kernel_L.str.4))
	addi	a0, a0, %lo(%larel(kernel_L.str.4,kernel_Lpcrel_hi12))
	call	print 
	lw	a0, -16(s0) 
	call	print_dec 
kernel_Lpcrel_hi13:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi13))
	call	print 
	li	a0, -3 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_9:
	lw	a1, -20(s0) 
	lw	a0, 8(a1) 
	lw	a1, 4(a1) 
	sub	a0, a0, a1 
	sw	a0, -32(s0) 
	lw	a0, -32(s0) 
	lui	a1, 8 
	addi	a1, a1, 1 
	bltu	a0, a1, kernel_LBB1_11 
	j	kernel_LBB1_10 
kernel_LBB1_10:
	lw	a0, -24(s0) 
	call	deallocate 
	lw	a0, -28(s0) 
	call	mm_deallocate 
kernel_Lpcrel_hi14:
	auipc	a0, %hi(%pcrel(kernel_L.str.5))
	addi	a0, a0, %lo(%larel(kernel_L.str.5,kernel_Lpcrel_hi14))
	call	print 
	li	a0, -4 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_11:
	lw	a0, -20(s0) 
	lw	a0, 4(a0) 
kernel_Lpcrel_hi15:
	auipc	a1, %hi(%pcrel(DMA_portal_ptr))
	addi	a1, a1, %lo(%larel(DMA_portal_ptr,kernel_Lpcrel_hi15))
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
kernel_Lpcrel_hi16:
	auipc	a0, %hi(%pcrel(next_id))
	addi	a0, a0, %lo(%larel(next_id,kernel_Lpcrel_hi16))
	lw	a0, 0(a0) 
	lw	a1, -24(s0) 
	sw	a0, 16(a1) 
kernel_Lpcrel_hi17:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi17))
	lw	a0, 0(a0) 
	bnez	a0, kernel_LBB1_13 
	j	kernel_LBB1_12 
kernel_LBB1_12:
	lw	a0, -24(s0) 
	sw	a0, 20(a0) 
	lw	a0, -24(s0) 
kernel_Lpcrel_hi18:
	auipc	a1, %hi(%pcrel(current_process))
	addi	a1, a1, %lo(%larel(current_process,kernel_Lpcrel_hi18))
	sw	a0, 0(a1) 
	j	kernel_LBB1_14 
kernel_LBB1_13:
kernel_Lpcrel_hi19:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a1, a0, %lo(%larel(current_process,kernel_Lpcrel_hi19))
	lw	a0, 0(a1) 
	lw	a0, 20(a0) 
	lw	a2, -24(s0) 
	sw	a0, 20(a2) 
	lw	a0, -24(s0) 
	lw	a1, 0(a1) 
	sw	a0, 20(a1) 
	j	kernel_LBB1_14 
kernel_LBB1_14:
kernel_Lpcrel_hi20:
	auipc	a0, %hi(%pcrel(next_id))
	addi	a2, a0, %lo(%larel(next_id,kernel_Lpcrel_hi20))
	lw	a0, 0(a2) 
	addi	a1, a0, 1 
	sw	a1, 0(a2) 
	sw	a0, -12(s0) 
	j	kernel_LBB1_15 
kernel_LBB1_15:
	lw	a0, -12(s0) 
	lw	ra, 28(sp) # 4-byte Folded Reload 
	lw	s0, 24(sp) # 4-byte Folded Reload 
	addi	sp, sp, 32 
	ret	
kernel_Lfunc_end1:
	#	-- End function 
run_next:
	#	%bb.0: 
	addi	sp, sp, -32 
	sw	ra, 28(sp) # 4-byte Folded Spill 
	sw	s0, 24(sp) # 4-byte Folded Spill 
	addi	s0, sp, 32 
kernel_Lpcrel_hi21:
	auipc	a0, %hi(%pcrel(kernel_L.str))
	addi	a0, a0, %lo(%larel(kernel_L.str,kernel_Lpcrel_hi21))
	call	print 
kernel_Lpcrel_hi22:
	auipc	a0, %hi(%pcrel(next_ROM_number))
	addi	a0, a0, %lo(%larel(next_ROM_number,kernel_Lpcrel_hi22))
	sw	a0, -20(s0) # 4-byte Folded Spill 
	lw	a0, 0(a0) 
	call	print_dec 
kernel_Lpcrel_hi23:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi23))
	call	print 
	lw	a1, -20(s0) # 4-byte Folded Reload 
kernel_Lpcrel_hi24:
	auipc	a0, %hi(%pcrel(ROM_device_code))
	addi	a0, a0, %lo(%larel(ROM_device_code,kernel_Lpcrel_hi24))
	lw	a0, 0(a0) 
	lw	a1, 0(a1) 
	call	find_device 
	sw	a0, -12(s0) 
	lw	a0, -12(s0) 
	bnez	a0, kernel_LBB2_2 
	j	kernel_LBB2_1 
kernel_LBB2_1:
	j	kernel_LBB2_5 
kernel_LBB2_2:
kernel_Lpcrel_hi25:
	auipc	a0, %hi(%pcrel(next_ROM_number))
	addi	a0, a0, %lo(%larel(next_ROM_number,kernel_Lpcrel_hi25))
	lw	a0, 0(a0) 
	call	do_run 
	sw	a0, -16(s0) 
	lw	a0, -16(s0) 
	bgez	a0, kernel_LBB2_4 
	j	kernel_LBB2_3 
kernel_LBB2_3:
	j	kernel_LBB2_5 
kernel_LBB2_4:
kernel_Lpcrel_hi26:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi26))
	lw	a1, 0(a0) 
	lw	a1, 0(a1) 
kernel_Lpcrel_hi27:
	auipc	a2, %hi(%pcrel(preserved_epc))
	addi	a2, a2, %lo(%larel(preserved_epc,kernel_Lpcrel_hi27))
	sw	a1, 0(a2) 
	lw	a1, 0(a0) 
	lw	a1, 4(a1) 
kernel_Lpcrel_hi28:
	auipc	a2, %hi(%pcrel(preserved_sp))
	addi	a2, a2, %lo(%larel(preserved_sp,kernel_Lpcrel_hi28))
	sw	a1, 0(a2) 
	lw	a1, 0(a0) 
	lw	a1, 8(a1) 
kernel_Lpcrel_hi29:
	auipc	a2, %hi(%pcrel(user_base))
	addi	a2, a2, %lo(%larel(user_base,kernel_Lpcrel_hi29))
	sw	a1, 0(a2) 
	lw	a0, 0(a0) 
	lw	a0, 12(a0) 
kernel_Lpcrel_hi30:
	auipc	a1, %hi(%pcrel(user_limit))
	addi	a1, a1, %lo(%larel(user_limit,kernel_Lpcrel_hi30))
	sw	a0, 0(a1) 
kernel_Lpcrel_hi31:
	auipc	a0, %hi(%pcrel(next_ROM_number))
	addi	a1, a0, %lo(%larel(next_ROM_number,kernel_Lpcrel_hi31))
	lw	a0, 0(a1) 
	addi	a0, a0, 1 
	sw	a0, 0(a1) 
	call	cpu_scheduler 
	j	kernel_LBB2_5 
kernel_LBB2_5:
	lw	ra, 28(sp) # 4-byte Folded Reload 
	lw	s0, 24(sp) # 4-byte Folded Reload 
	addi	sp, sp, 32 
	ret	
kernel_Lfunc_end2:
	#	-- End function 
do_noop:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
kernel_Lpcrel_hi32:
	auipc	a0, %hi(%pcrel(kernel_L.str.6))
	addi	a0, a0, %lo(%larel(kernel_L.str.6,kernel_Lpcrel_hi32))
	call	print 
kernel_Lpcrel_hi33:
	auipc	a0, %hi(%pcrel(kernel_L.str.7))
	addi	a0, a0, %lo(%larel(kernel_L.str.7,kernel_Lpcrel_hi33))
	call	print 
kernel_Lpcrel_hi34:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi34))
	call	print 
kernel_Lpcrel_hi35:
	auipc	a0, %hi(%pcrel(preserved_epc))
	addi	a1, a0, %lo(%larel(preserved_epc,kernel_Lpcrel_hi35))
	lw	a0, 0(a1) 
	addi	a0, a0, 4 
	sw	a0, 0(a1) 
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end3:
	#	-- End function 
do_exit:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
	sw	a0, -12(s0) 
kernel_Lpcrel_hi36:
	auipc	a0, %hi(%pcrel(kernel_L.str.8))
	addi	a0, a0, %lo(%larel(kernel_L.str.8,kernel_Lpcrel_hi36))
	call	print 
	lw	a0, -12(s0) 
	call	print_dec 
kernel_Lpcrel_hi37:
	auipc	a0, %hi(%pcrel(kernel_L.str.1))
	addi	a0, a0, %lo(%larel(kernel_L.str.1,kernel_Lpcrel_hi37))
	call	print 
kernel_Lpcrel_hi38:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi38))
	lw	a0, 0(a0) 
	sw	a0, -16(s0) 
	lw	a1, -16(s0) 
	lw	a0, 20(a1) 
	bne	a0, a1, kernel_LBB4_2 
	j	kernel_LBB4_1 
kernel_LBB4_1:
kernel_Lpcrel_hi39:
	auipc	a0, %hi(%pcrel(kernel_L.str.9))
	addi	a0, a0, %lo(%larel(kernel_L.str.9,kernel_Lpcrel_hi39))
	call	print 
	lw	a0, -16(s0) 
	lw	a0, 8(a0) 
	call	mm_deallocate 
	lw	a0, -16(s0) 
	call	deallocate 
kernel_Lpcrel_hi40:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a1, a0, %lo(%larel(current_process,kernel_Lpcrel_hi40))
	li	a0, 0 
	sw	a0, 0(a1) 
	j	kernel_LBB4_9 
kernel_LBB4_2:
	j	kernel_LBB4_3 
kernel_LBB4_3:
kernel_Lpcrel_hi41:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi41))
	lw	a0, 0(a0) 
	lw	a0, 20(a0) 
	lw	a1, -16(s0) 
	beq	a0, a1, kernel_LBB4_5 
	j	kernel_LBB4_4 
kernel_LBB4_4:
kernel_Lpcrel_hi42:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a1, a0, %lo(%larel(current_process,kernel_Lpcrel_hi42))
	lw	a0, 0(a1) 
	lw	a0, 20(a0) 
	sw	a0, 0(a1) 
	j	kernel_LBB4_3 
kernel_LBB4_5:
	lw	a0, -16(s0) 
	lw	a1, 20(a0) 
kernel_Lpcrel_hi43:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi43))
	lw	a2, 0(a0) 
	sw	a1, 20(a2) 
	lw	a1, 0(a0) 
	lw	a1, 20(a1) 
	sw	a1, 0(a0) 
	lw	a0, 0(a0) 
	lw	a1, -16(s0) 
	lw	a1, 20(a1) 
	beq	a0, a1, kernel_LBB4_7 
	j	kernel_LBB4_6 
kernel_LBB4_6:
kernel_Lpcrel_hi44:
	auipc	a0, %hi(%pcrel(kernel_L.str.10))
	addi	a0, a0, %lo(%larel(kernel_L.str.10,kernel_Lpcrel_hi44))
	call	print 
	call	halt_kernel 
	j	kernel_LBB4_8 
kernel_LBB4_7:
kernel_Lpcrel_hi45:
	auipc	a0, %hi(%pcrel(kernel_L.str.11))
	addi	a0, a0, %lo(%larel(kernel_L.str.11,kernel_Lpcrel_hi45))
	call	print 
	j	kernel_LBB4_8 
kernel_LBB4_8:
	lw	a0, -16(s0) 
	lw	a0, 8(a0) 
	call	mm_deallocate 
	lw	a0, -16(s0) 
	call	deallocate 
kernel_Lpcrel_hi46:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi46))
	lw	a1, 0(a0) 
	lw	a1, 0(a1) 
kernel_Lpcrel_hi47:
	auipc	a2, %hi(%pcrel(preserved_epc))
	addi	a2, a2, %lo(%larel(preserved_epc,kernel_Lpcrel_hi47))
	sw	a1, 0(a2) 
	lw	a1, 0(a0) 
	lw	a1, 4(a1) 
kernel_Lpcrel_hi48:
	auipc	a2, %hi(%pcrel(preserved_sp))
	addi	a2, a2, %lo(%larel(preserved_sp,kernel_Lpcrel_hi48))
	sw	a1, 0(a2) 
	lw	a1, 0(a0) 
	lw	a1, 8(a1) 
kernel_Lpcrel_hi49:
	auipc	a2, %hi(%pcrel(user_base))
	addi	a2, a2, %lo(%larel(user_base,kernel_Lpcrel_hi49))
	sw	a1, 0(a2) 
	lw	a0, 0(a0) 
	lw	a0, 12(a0) 
kernel_Lpcrel_hi50:
	auipc	a1, %hi(%pcrel(user_limit))
	addi	a1, a1, %lo(%larel(user_limit,kernel_Lpcrel_hi50))
	sw	a0, 0(a1) 
	call	cpu_scheduler 
	j	kernel_LBB4_9 
kernel_LBB4_9:
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end4:
	#	-- End function 
do_print:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
	sw	a0, -16(s0) 
	lw	a0, -16(s0) 
kernel_Lpcrel_hi51:
	auipc	a1, %hi(%pcrel(user_base))
	addi	a1, a1, %lo(%larel(user_base,kernel_Lpcrel_hi51))
	lw	a1, 0(a1) 
	add	a0, a0, a1 
	sw	a0, -16(s0) 
	lw	a0, -16(s0) 
kernel_Lpcrel_hi52:
	auipc	a1, %hi(%pcrel(user_limit))
	addi	a1, a1, %lo(%larel(user_limit,kernel_Lpcrel_hi52))
	lw	a1, 0(a1) 
	bltu	a0, a1, kernel_LBB5_2 
	j	kernel_LBB5_1 
kernel_LBB5_1:
	li	a0, -1 
	sw	a0, -12(s0) 
	j	kernel_LBB5_3 
kernel_LBB5_2:
	lw	a0, -16(s0) 
	call	print 
kernel_Lpcrel_hi53:
	auipc	a0, %hi(%pcrel(preserved_epc))
	addi	a1, a0, %lo(%larel(preserved_epc,kernel_Lpcrel_hi53))
	lw	a0, 0(a1) 
	addi	a0, a0, 4 
	sw	a0, 0(a1) 
	li	a0, 0 
	sw	a0, -12(s0) 
	j	kernel_LBB5_3 
kernel_LBB5_3:
	lw	a0, -12(s0) 
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end5:
	#	-- End function 
do_syscall:
	#	%bb.0: 
	addi	sp, sp, -32 
	sw	ra, 28(sp) # 4-byte Folded Spill 
	sw	s0, 24(sp) # 4-byte Folded Spill 
	addi	s0, sp, 32 
	sw	a0, -12(s0) 
	sw	a1, -16(s0) 
	li	a0, 0 
	sb	a0, -17(s0) 
	sw	a0, -24(s0) 
	lw	a0, -12(s0) 
	lui	a1, 827664 
	bne	a0, a1, kernel_LBB6_2 
	j	kernel_LBB6_1 
kernel_LBB6_1:
	call	do_noop 
	j	kernel_LBB6_12 
kernel_LBB6_2:
	lw	a0, -12(s0) 
	lui	a1, 827664 
	addi	a1, a1, 1 
	bne	a0, a1, kernel_LBB6_4 
	j	kernel_LBB6_3 
kernel_LBB6_3:
	lw	a0, -16(s0) 
	call	do_exit 
kernel_Lpcrel_hi54:
	auipc	a0, %hi(%pcrel(kernel_L.str.12))
	addi	a0, a0, %lo(%larel(kernel_L.str.12,kernel_Lpcrel_hi54))
	call	print 
	call	halt_kernel 
	j	kernel_LBB6_11 
kernel_LBB6_4:
	lw	a0, -12(s0) 
	lui	a1, 827664 
	addi	a1, a1, 2 
	bne	a0, a1, kernel_LBB6_6 
	j	kernel_LBB6_5 
kernel_LBB6_5:
	li	a0, 1 
	sb	a0, -17(s0) 
	lw	a0, -16(s0) 
	call	do_print 
	sw	a0, -24(s0) 
	j	kernel_LBB6_10 
kernel_LBB6_6:
	lw	a0, -12(s0) 
	lui	a1, 827664 
	addi	a1, a1, 3 
	bne	a0, a1, kernel_LBB6_8 
	j	kernel_LBB6_7 
kernel_LBB6_7:
	li	a0, 1 
	sb	a0, -17(s0) 
	lw	a0, -16(s0) 
	call	do_run 
	sw	a0, -24(s0) 
kernel_Lpcrel_hi55:
	auipc	a0, %hi(%pcrel(preserved_epc))
	addi	a1, a0, %lo(%larel(preserved_epc,kernel_Lpcrel_hi55))
	lw	a0, 0(a1) 
	addi	a0, a0, 4 
	sw	a0, 0(a1) 
	j	kernel_LBB6_9 
kernel_LBB6_8:
	li	a0, -1 
	sw	a0, -24(s0) 
	j	kernel_LBB6_9 
kernel_LBB6_9:
	j	kernel_LBB6_10 
kernel_LBB6_10:
	j	kernel_LBB6_11 
kernel_LBB6_11:
	j	kernel_LBB6_12 
kernel_LBB6_12:
	lbu	a0, -17(s0) 
	andi	a0, a0, 1 
	beqz	a0, kernel_LBB6_14 
	j	kernel_LBB6_13 
kernel_LBB6_13:
kernel_Lpcrel_hi56:
	auipc	a0, %hi(%pcrel(user_base))
	addi	a0, a0, %lo(%larel(user_base,kernel_Lpcrel_hi56))
	lw	a0, 0(a0) 
kernel_Lpcrel_hi57:
	auipc	a1, %hi(%pcrel(preserved_sp))
	addi	a1, a1, %lo(%larel(preserved_sp,kernel_Lpcrel_hi57))
	lw	a1, 0(a1) 
	add	a0, a0, a1 
	addi	a0, a0, -36 
	sw	a0, -28(s0) 
	lw	a0, -24(s0) 
	lw	a1, -28(s0) 
	sw	a0, 0(a1) 
	j	kernel_LBB6_14 
kernel_LBB6_14:
	call	cpu_scheduler 
	lw	ra, 28(sp) # 4-byte Folded Reload 
	lw	s0, 24(sp) # 4-byte Folded Reload 
	addi	sp, sp, 32 
	ret	
kernel_Lfunc_end6:
	#	-- End function 
do_alarm:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
kernel_Lpcrel_hi58:
	auipc	a0, %hi(%pcrel(kernel_L.str.13))
	addi	a0, a0, %lo(%larel(kernel_L.str.13,kernel_Lpcrel_hi58))
	call	print 
kernel_Lpcrel_hi59:
	auipc	a0, %hi(%pcrel(preserved_epc))
	addi	a3, a0, %lo(%larel(preserved_epc,kernel_Lpcrel_hi59))
	lw	a1, 0(a3) 
kernel_Lpcrel_hi60:
	auipc	a0, %hi(%pcrel(current_process))
	addi	a0, a0, %lo(%larel(current_process,kernel_Lpcrel_hi60))
	lw	a2, 0(a0) 
	sw	a1, 0(a2) 
kernel_Lpcrel_hi61:
	auipc	a1, %hi(%pcrel(preserved_sp))
	addi	a2, a1, %lo(%larel(preserved_sp,kernel_Lpcrel_hi61))
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
kernel_Lpcrel_hi62:
	auipc	a2, %hi(%pcrel(user_base))
	addi	a2, a2, %lo(%larel(user_base,kernel_Lpcrel_hi62))
	sw	a1, 0(a2) 
	lw	a0, 0(a0) 
	lw	a0, 12(a0) 
kernel_Lpcrel_hi63:
	auipc	a1, %hi(%pcrel(user_limit))
	addi	a1, a1, %lo(%larel(user_limit,kernel_Lpcrel_hi63))
	sw	a0, 0(a1) 
	call	cpu_scheduler 
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end7:
	#	-- End function 
run_init:
	#	%bb.0: 
	addi	sp, sp, -16 
	sw	ra, 12(sp) # 4-byte Folded Spill 
	sw	s0, 8(sp) # 4-byte Folded Spill 
	addi	s0, sp, 16 
kernel_Lpcrel_hi64:
	auipc	a0, %hi(%pcrel(kernel_limit))
	addi	a0, a0, %lo(%larel(kernel_limit,kernel_Lpcrel_hi64))
	lw	a0, 0(a0) 
kernel_Lpcrel_hi65:
	auipc	a1, %hi(%pcrel(user_base))
	addi	a1, a1, %lo(%larel(user_base,kernel_Lpcrel_hi65))
	sw	a0, 0(a1) 
kernel_Lpcrel_hi66:
	auipc	a0, %hi(%pcrel(RAM_limit))
	addi	a0, a0, %lo(%larel(RAM_limit,kernel_Lpcrel_hi66))
	lw	a2, 0(a0) 
kernel_Lpcrel_hi67:
	auipc	a0, %hi(%pcrel(user_limit))
	addi	a0, a0, %lo(%larel(user_limit,kernel_Lpcrel_hi67))
	sw	a2, 0(a0) 
	lw	a0, 0(a0) 
	lw	a1, 0(a1) 
	sub	a0, a0, a1 
kernel_Lpcrel_hi68:
	auipc	a1, %hi(%pcrel(user_size))
	addi	a1, a1, %lo(%larel(user_size,kernel_Lpcrel_hi68))
	sw	a0, 0(a1) 
	call	run_next 
kernel_Lpcrel_hi69:
	auipc	a0, %hi(%pcrel(kernel_L.str.14))
	addi	a0, a0, %lo(%larel(kernel_L.str.14,kernel_Lpcrel_hi69))
	call	print 
	call	halt_kernel 
	lw	ra, 12(sp) # 4-byte Folded Reload 
	lw	s0, 8(sp) # 4-byte Folded Reload 
	addi	sp, sp, 16 
	ret	
kernel_Lfunc_end8:
	#	-- End function 
next_ROM_number:
	.Numeric
	.word	3                               # 0x3
user_base:
	.word	0                               # 0x0
user_limit:
	.word	0                               # 0x0
user_size:
	.word	0                               # 0x0
next_id:
	.word	0                               # 0x0
current_process:
	.word	0
kernel_L.str:
	.Text
	.asciz	"[kernel:] RUN ROM #"
kernel_L.str.1:
	.asciz	"\n"
kernel_L.str.2:
	.asciz	"[kernel:] Invalid ROM number\n"
kernel_L.str.3:
	.asciz	"[kernel:] Process allocation failed for ROM #"
kernel_L.str.4:
	.asciz	"[kernel:] Main memory allocation failed for ROM #"
kernel_L.str.5:
	.asciz	"[kernel:] ROM is too large to fit in main memory\n"
kernel_L.str.6:
	.asciz	"[debug: ] "
kernel_L.str.7:
	.asciz	"NOOP requested"
kernel_L.str.8:
	.asciz	"[kernel:] EXIT process with status "
kernel_L.str.9:
	.asciz	"[kernel:] completed all processes. \n"
kernel_L.str.10:
	.asciz	"[kernel:] unlink failed\n"
kernel_L.str.11:
	.asciz	"[kernel:] unlink worked!\n"
kernel_L.str.12:
	.asciz	"[kernel:] All processes terminated\n"
kernel_L.str.13:
	.asciz	"[kernel:] ALARM interrupt caught\n"
kernel_L.str.14:
	.asciz	"[kernel:] Failed to run, no user ROMs\n"
