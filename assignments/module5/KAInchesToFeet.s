# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 3b) Then write a second program to do the reverse, taking one input in inches and convert it to feet and inches 
# (this requires a remainder operation, that is not available on the Pi, so you have to write your own).

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Print prompt for an input in inches
    LDR r0, =prompt1
    BL printf

    # Read in the input value
    LDR r0, =formatStr
    LDR r1, =inInches
    BL scanf

    # Convert inches to feet and store remainder
    LDR r1, =inInches
    LDR r0, [r1]
    MOV r1, #12
    BL __aeabi_idivmod // will store quotient in r0, remainder in r1

    # Get result and print 
    MOV r2, r1 // store remainder in r2
    MOV r1, r0 // store quotient in r1
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter a number in inches:\n"
    formatStr: .asciz "%d"
    inInches: .word 0
    outStr: .asciz "The value in feet and inches is %d'%d\"\n"
