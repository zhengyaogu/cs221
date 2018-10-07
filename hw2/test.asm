
.data
    str: .asciiz "gutentag"
    buffer: .space 3
    main_return: .word 0
.text

countOccurrences:
    li $t0, 0 # index
    li $t3, 0 # count
loop:
    add $t1, $a1, $t0 # t1 has the current adress of the character were examine
    lb $t2, ($t1) # t2 has the current character
    beq $t2, 0, done
    bne $a0, $t2, skip
    addi $t3, $t3, 1    # count++
skip:
    addi $t0, $t0, 1    # index++
    b loop
done:
    jr $ra


main:
    li $v0, 8       # take in input

    la $a0, buffer  # load byte space into address
    li $a1, 3     # allot the byte space for string
    move $t0, $a0
    syscall

    lb $a0, ($t0) # the character is now in a0
    la $a1, str # a1 has the base address of the string

    sw $ra, main_return
    jal countOccurrences
    lw $ra, main_return
    
    li $v0, 1
    move $a0, $t3
    syscall


    jr $ra

    