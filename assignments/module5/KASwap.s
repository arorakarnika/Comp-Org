# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# * (Extra Credit 5 points) - In a normal swap a temporary variable is needed, eg "r2 = r0; r0 = r1; r1 = r2; " 
# swaps r0 and r1.  A swap can be implemented without the temporary r2 register using xor operations (the eor instruction). 
# Write a program to swap two registers using eor instructions.

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Prompt for values to swap
    LDR r0, =prompt
    BL printf

    # Read in input values
    LDR r0, =formatIn
    LDR r1, =input1
    LDR r2, =input2
    BL scanf

    # Swap the values
    LDR r1, [r1]
    LDR r2, [r2]
    EOR r1, r1, r2
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt: .asciz "Enter two comma separated numbers to swap (e.g. 2,3): "
    formatIn: .asciz "%d,%d"
    input1: .word 0
    input2 .word 0
    outStr: .asciz "The swapped values are %d,%d"