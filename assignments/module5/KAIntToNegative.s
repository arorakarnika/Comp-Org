# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 2 - Write a program that reads an integer number and writes out the negative value of the number.  
# To do this you must implement a 2's complement operation on the value, which is calculating the one's complement, and add 1. 
# To get a 1's complement use the MVN operation.

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Print a prompt for the input int
    LDR r0, =inputPrompt
    BL printf

    # Read in the entered integer value
    LDR r0, =formatInput
    LDR r1, =inInt
    BL scanf

    # Do a Two's Complement operation to get the negative value
    # First, invert the bits aka get the ones complement
    LDR r1, =inInt
    LDR r2, [r1]
    MVN r0, r2

    # Add 1 to get the two's complement
    MOV r1, r0 // move the ones complement value into r1
    ADD r0, r1, #1

    # print the output
    MOV r1, r0 
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 
.data
    inputPrompt: .asciz "Enter an integer:\n"
    formatInput: .asciz "%d"
    inInt: .word 0
    outStr: .asciz "The negative value of the integer you entered is %d\n"
