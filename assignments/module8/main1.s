# Program Name: main1.s
# Author: Karnika Arora
# Date: 07/23/2023
# Module 8 Assignment
# Purpose: Use functions from libConversions.s to convert miles to kilometers, and miles and hours to kilometers per hour
# Inputs: miles, hours
# Outputs: miles, miles per hour

.global main
main:
    // Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    // Print prompt for two input numbers
    LDR r0, =prompt1
    BL printf

    // Read in user input for miles and hours
    LDR r0, =formatStr
    LDR r1, =inMiles
    LDR r2, =inHours
    BL scanf

    // Convert miles to kilometers
    LDR r0, =inMiles
    LDR r0, [r0]
    BL miles2kilometer // now r0 has the kilometer value

    // Store the kilometer value in outKilometers
    // It will be printed at the end with the kilometers per hour value
    LDR r1, =outKilometers
    STR r0, [r1]

    // Convert miles and hours to kilometers per hour
    LDR r0, =inMiles
    LDR r0, [r0]
    LDR r1, =inHours
    LDR r1, [r1]
    BL kph


    // Print result
    MOV r4, r0 // move the kph value into r4 for the output string format
    LDR r0, =outStr
    LDR r1, =inMiles
    LDR r1, [r1]
    LDR r2, =outKilometers
    LDR r2, [r2]
    LDR r3, =inHours
    LDR r3, [r3]
    BL printf


    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt1: .asciz "Enter the number of miles followed by hours, separated by a comma e.g. 20,1: "
    formatStr: .asciz "%d,%d"
    inMiles: .word 0
    inHours: .word 0
    outKilometers: .word 0
    outKph: .word 0
    outStr: .asciz "%d in kilometers is %d. Over %d hours, that is %d kilometers per hour. \n"
