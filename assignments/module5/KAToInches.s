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
    LDR r1, =inFeet // input will be in the format 6'5", giving us two values for inFeet and inInches
    LDR r2, =inInches
    BL scanf

    # Convert feet to inches
    LDR r1, =inFeet
    LDR r2, [r1]
    MOV r3, #12 // move the number 12 into r3
    MUL r0, r2, r3

    # Add inches to the converted value to get final result
    MOV r1, r0 // the result from MUL earlier is in r0, move it into r1
    LDR r2, =inInches
    LDR r3, [r2]
    ADD r0, r1, r3 // our final result is now in r0

    # Print the final value
    MOV r3, r0 // free up r0 since printf requires the formatted string to be in r0, final val in r3
    LDR r0, =inFeet
    LDR r1, [r0] // r1 has our original input value for inFeet
    LDR r0, =inInches
    LDR r2, [r0] // r2 has our input in inches
    LDR r0, =outStr
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter a number in feet followed by a number in inches, using the format 5'5\": "
    formatStr: .asciz "%d'%d\""
    inFeet: .word 0
    inInches: .word 0
    outStr: .asciz "The value  %d'%d\" in inches is %d\n"
