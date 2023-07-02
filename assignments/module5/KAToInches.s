# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 3a) - Read two input numbers that represent feet and inches and convert this answer to be just inches.
# Then write a second program to do the reverse, taking one input in inches and convert it to feet and inches 
# (this requires a remainder operation, that is not available on the Pi, so you have to write your own).

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Print prompt for two input numbers
    LDR r0, =prompt1
    BL printf

    # Read in the input values
    LDR r0, =formatStr
    LDR r1, =inFeet
    LDR r2, =inInches
    BL scanf

    # Convert feet to inches
    LDR r1, =inFeet
    LDR r2, [r1]
    MOV r3, #12
    MUL r0, r2, r3

    # Add inches to the converted value to get final result
    MOV r1, r0
    LDR r2, =inInches
    LDR r3, [r2]
    ADD r0, r1, r3

    # Print the final value
    MOV r1, r0
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter a number in feet followed by a number in inches, using the format 5'5\":\n"
    formatStr: .asciz "%d'%d\""
    inFeet: .word 0
    inInches: .word 0
    outStr: .asciz "The value in inches is %d\n"
