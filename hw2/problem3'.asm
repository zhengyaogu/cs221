.data 
    command1:   .asciiz "Please enter a sentence "
    command2:   .asciiz "Please enter a character "
    count:      .word 10
    sentence:   .space 100
    character:  .space 4
    command3:   .asciiz " Character "
    command4:   .asciiz " appears in the sentence "
    command5:   .asciiz " times. "

.text
.globl main
main:
    li $t0, 100 #end var for loop
    li $t1, 0   #start var for loop
    li $t2, 0   #number of occurences

    la $a0, command1    #print 'please enter sentence'
    li $v0, 4
    syscall


    la $a0, sentence    #input sentence
    li $a1, 100
    li $v0, 8
    syscall

    la $a0, command2    #print 'please enter char'
    li $v0, 4
    syscall

    la $a0, character   #input character
    li $a1, 4
    li $v0, 8
    syscall

    la $s0, character
    lb $s1, ($s0)
    la $t3, sentence
    lb $a2, ($t3) #gets first char of sentence

loop:
    #addi $a2, $a2, 1
    beq $a2, $zero, end     #once reach end of char array, prints result
    beq $a2, $s1, something #if the char within sentence == comparing char
    addi $a2, $a2, 1        #increment char array
    j loop

something:              
    addi $t2, $t2, 1        #increments number of occurences of char 
end:
    la $a0, command3
    li $v0, 4
    syscall

    la $a0, character
    li $v0, 11
    syscall

    la $a0, command4
    li $v0, 4
    syscall

    la $a0 sentence
    li $v0, 4
    syscall

    #la $a0, $t2
    li $v0, 1
    move $a0, $t2
    syscall

    la $a0, command5
    li $v0, 4
    syscall