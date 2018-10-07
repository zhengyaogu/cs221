	.data
prompt: .asciiz "The number of even numbers in the array is "
arr: .word 1, 2, 3, 4, 5, 6, 7, 8
num: .word 8
return_main: .word 0
	.text
	.align 2
	.globl main

numEvens:
	li		$t4, 0 # count
	li		$t0, 0 # index
loop:
	div		$t0, $t6
	mflo		$t5
	bge		$t5, $a1, done
	add     $t1, $a0, $t0 # current address
	lw		$t2, ($t1) # load current num
	div		$t2, $t7
	mfhi		$t3 # remainder
	beq		$t3, 1, skip
	addi		$t4, $t4, 1 # count++
skip:
	addi		$t0, $t0, 4
	b loop
done:
	jr		$ra



main:
	li		$t6, 4
	li		$t7, 2

	la		$a0, arr # address of arr
	lw		$a1, num # length of arr

	sw		$ra, return_main
	jal		numEvens
	lw		$ra, return_main

	li		$v0, 4
	la 		$a0, prompt
	syscall

	li		$v0, 1
	move		$a0, $t4
	syscall

	jr		$ra

