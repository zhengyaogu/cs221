		.text
		.globl	main
main:
	li		$v0, 5
	syscall
	ble		$v0, 0, exit
	li		$t0, 0		# init sum
	li		$t1, 1		# index
loop:
	add		$t0, $t0, $t1
	addi		$t1, $t1, 1
	ble		$t1, $v0, loop #if index smaller or equal to n, loop
	b done
done:
	li		$v0, 1		#print sum
	move		$a0, $t0
	syscall
exit:
	li		$v0, 10		#quit program
	syscall