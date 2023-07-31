# Program Name: findMax.s
# Author: Karnika Arora
# Date: 07/30/2023
# Module 9 Assignment #3
# Purpose: Implement a function to find the largest of 3 values.  
#   The function signature is "findMaxOf3(int val1, int val2, int val3)".  
#   The function should compare the 3 values, and return the largest.  
#   Be sure to use the ABI standards for all arguments and return values.  
#   Write a program to prompt for 3 values, call this function to the find the maximum value, and print out the maximum value.  Follow proper style for assembly.
# Functions: main, findMaxOf3(int val1, int val2, int val3) => int maxVal

.global main
.global findMaxOf3

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Prompt for input values to compare
    LDR r0, =promptInput
    BL printf

    // Read in the input values
    LDR r0, =inputFormat
    LDR r1, =val1
    LDR r2, =val2
    LDR r3, =val3
    BL scanf

    // Call the findMaxOf3 function
    LDR r0, =val1
    LDR r0, [r0]
    LDR r1, =val2
    LDR r1, [r1]
    LDR r2, =val3
    LDR r2, [r2]
    BL findMaxOf3

    // Print the max value
    MOV r1, r0 // this is the max value from the findMaxOf3 function
    LDR r0, =result
    BL printf

     # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    promptInput: .asciz "Enter 3 comma separated values: "
    inputFormat: .asciz "%d,%d,%d"
    val1: .word 0
    val2: .word 0
    val3: .word 0
    result: .asciz "The max value is %d\n"


# END MAIN FUNCTION


# START findMaxOf3 FUNCTION
.text
findMaxOf3:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Compare the 3 values
    MOV r3, #0 // logical value to keep track of if val1 is greater than val2
    CMP r0, r1
    ADDGE r3, r3, #1 // if val1 is greater than val2, r3 = 1, and we move on to comparing it to val3
    CMP r3, #1
    BEQ compareVal1Val3 // if val1 is greater than val2, compare it to val3
        // if val1 < val2, it can't be the max: compare val2 to val3
        // if val3 is greater than val2, val3 is the max
        // if val2 is greater than val3, val2 is the max
        B endVal1Val3Comparison
    compareVal1Val3:
        MOV r3, #0 // logical value to keep track of if val1 is greater than val3
        CMP r0, r2
        ADDGE r3, r3, #1 // if val1 is greater than val3, r3 = 1, and it is the max
        CMP r3, #1
        BEQ val1Max
            // if val1 < val3, but val1 > val2, val3 is the max
            B val3Max
    endVal1Val3Comparison:
    // val1 < val2, so compare val2 to val3
    MOV r3, #0 // logical value to keep track of if val2 is greater than val3
    CMP r1, r2
    ADDGE r3, r3, #1 // if val2 is greater than val3, r3 = 1, and it is the max
    CMP r3, #1
    BEQ val2Max
        // if val2 < val3, but val1 < val2, val3 is the max
        B val3Max

    val1Max:
        MOV r0, r0
        B endFindMaxOf3
    val2Max:
        MOV r0, r1
        B endFindMaxOf3
    val3Max:
        MOV r0, r2
        B endFindMaxOf3
    
    endFindMaxOf3:

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data

# END findMaxOf3 FUNCTION