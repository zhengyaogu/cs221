	.data
str: .space 21
	.text
	.align 2
	.globl main

isLowerCase:
	bge $a0, 97, next
	b zero
next:
	ble $a0, 122, one
	b zero
one:
	li $v0, 1
	jr $ra
zero:
	li $v0, 0
	jr $ra


getUpperCase:
	addi $v0, $a0, -32
	jr $ra

convertString:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	move $t2, $a0
loop:
	lb $t1, ($t2)
	beq $t1, 0, done
	move $a0, $t1 # give param to isLowerCase

	jal isLowerCase
	beq $v0, 0, skip_convert
	jal getUpperCase
	sb $v0, ($t2)
skip_convert:
	addi $t2, $t2, 1
	b loop
done:
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra

main:
	li $v0, 8
	la $a0, str
	li $a1, 21
	syscall

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal convertString

	li $v0, 4
	la $a0, str
	syscall

	lw $ra, ($sp)
	jr $ra
