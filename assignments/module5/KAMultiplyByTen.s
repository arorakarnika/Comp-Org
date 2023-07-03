# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 4 - Read an input number and using left logical shifts and add instructions  
# multiply that number by 10 and print out the result.
# * (Extra Credit 5 points) - In a normal swap a temporary variable is needed,
# eg "r2 = r0; r0 = r1; r1 = r2; " swaps r0 and r1.  A swap can be implemented without the temporary
# r2 register using xor operations (the eor instruction). 
# Write a program to swap two registers using eor instructions.

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Print prompt for an input number
    LDR r0, =prompt1
    BL printf

    # Read in the input value
    LDR r0, =formatStr
    LDR r1, =inputNum
    BL scanf

    # Multiply by 10
    LDR r0, =inputNum
    LDR r1, [r0]
    LSL r2, r1, #3 // shifting by 3 bits = multiplying by 2^3
    LSL r3, r1, #1 // shifting by 1 bit = multiplying by 2
    
    # Add r3 and r2 to get the result of multiplication by 10
    ADD r4, r2, r3
    
    # Get result and print - result is in r3
    MOV r1, r4 // move result into r1
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter an integer:\n"
    formatStr: .asciz "%d"
    inputNum: .word 0
    outStr: .asciz "The integer multiplied by 10 is: %d\n"