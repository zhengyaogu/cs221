	.data
max:	.word	0
prompt1: .asciiz "Enter the number of numbers you want to enter: "
prompt2: .asciiz "\nEnter your numbers, seperate them with Enter key.\n"
prompt3: .asciiz "The maximum among the numbers you enter is: "
	.text
	.align 2
	.globl main
main:
	li		$v0, 4
	la		$a0, prompt1
	syscall

	li		$v0, 5
	syscall

	ble $v0, 0, return

	li		$v0, 4
	la		$a0, prompt2
	syscall

	move		$t0, $v0 # num of numbers
	li		$t1, 1 # index
	li		$v0, 5
	syscall
	move		$t2, $v0 #max
loop:
	li		$v0, 5
	syscall
	bgt		$v0, $t2, update
	ble		$v0, $t2, incriment
update:
	move		$t2, $v0
incriment:
	addi		$t1, 1
	bge		$t1, $t0, end
	b		loop
end:
	li		$v0, 4
	la		$a0, prompt3
	syscall

	sw		$t2, max
	li		$v0, 1
	move		$a0, $t2
	syscall
return:
	jr		$ra