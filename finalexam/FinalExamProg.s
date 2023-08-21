# Program Name: 
# Author: Karnika Arora
# Date: 08/20/2023
# Final Exam
# Purpose: Write an ARM program that uses a looping structure to read integer values from a user until a "-1" is entered, and then print out the number of values entered, 
#   the total of all the value, and the average of the values.
# Functions: main

.global main

# START MAIN FUNCTION
.text
main:
    # Program dictionary
    # r4 = number entered by the user

    # Push the stack
    SUB sp, sp, #12 
    STR lr, [sp, #0]
    STR r4, [sp, #4]

    # Initialize the count of values entered
    MOV r5, #0

    # Initialize the sum for values entered
    MOV r4, #0
    
    StartPromptLoop:
        # Prompt the user for input
        LDR r0, =promptNum
        BL printf

        # Read the number
        LDR r0, =numberFormat
        LDR r1, =inputNum
        BL scanf

        # Store the number in r6
        LDR r6, =inputNum
        LDR r6, [r6]

        # Check if the number is -1
        CMP r6, #-1
        BEQ endPromptLoop
            B Continue
        
        Continue:
        # Calculate the sum and the number of values entered
        ADD r5, r5, #1
        ADD r6, r4, r6
        
    
    endPromptLoop:
    # Calculate the average
    MOV r0, r4
    MOV r1, r5
    BL __aeabi_idiv

    # Print the result
    MOV r3, r0
    LDR r0, =resultOutput
    LDR r1, =r5
    LDR r2, =r4
    BL printf
   
    # Pop the stack and return
    LDR lr, [sp, #0] 
    LDR r4, [sp, #4]
    ADD sp, sp, #12 
    MOV pc, lr 

.data
    promptNum: .asciz "Enter a number: "
    numberFormat: .asciz "%d"
    inputNum: .word 0
    resultOutput: .asciz "The number of values entered is %d, the sum of the values is %d, and the average of the values is %d\n"

# END MAIN FUNCTION
