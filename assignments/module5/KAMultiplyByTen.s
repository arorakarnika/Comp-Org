# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 4 - Read an input number and using left logical shifts and add instructions  
# multiply that number by 10 and print out the result.

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
    MOV r2, r4 // move result into r2, original input is already in r1
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter an integer: "
    formatStr: .asciz "%d"
    inputNum: .word 0
    outStr: .asciz "The integer %d multiplied by 10 is: %d\n"