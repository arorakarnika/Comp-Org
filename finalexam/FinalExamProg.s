# Program Name: 
# Author: Karnika Arora
# Date: 08/20/2023
# Final Exam
# Purpose: Write an ARM program that uses a looping structure to read integer values from a user until a "-1" is entered, and then print out the number of values entered, 
#   the total of all the value, and the average of the values.
# Functions:
#   - main: The main function of the program. It prompts the user for input, reads the input, and calculates the sum and average of the values entered.
#           The user will continue to be prompted for input until a "-1" is entered.
#           Once a -1 is entered, the program will print the number of values entered, the sum of the values, and the average of the values.

.global main

# START MAIN FUNCTION
# Pseudocode (Python3):
@ count = 0
@ sum = 0
@ n = 0
@ while n != -1:
@     n = int(input("Enter a number: "))
@     if n == -1:
@         break
@     sum += n
@     count += 1

@ avg = sum / count
@ print(f"The number of values entered is {count}, the sum of the values is {sum}, and the average of the values is {avg}\n")

.text
main:
    # Program dictionary
    # r4 = The sum of all values entered
    # r5 = The number of values entered
    # r6 = The number entered
    # r7 = The average of the values entered

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
        ADD r4, r4, r6
        B StartPromptLoop
        
    
    endPromptLoop:
    
    # Calculate the average
    MOV r0, r4
    MOV r1, r5
    BL __aeabi_idivmod

    # Round up the average if necessary
    MOV r7, r0 // store quotient in r7
    MOV r8, r1 // store remainder in r8
    MOV r0, r5
    MOV r1, #2
    BL __aeabi_idiv
    CMP r8, r0
    BGT roundUp // If the remainder is greater than or equal to half of the divisor, round up
        B endRoundUp
    roundUp:
        ADD r7, r7, #1
    endRoundUp:

    # Print the result
    MOV r3, r7
    LDR r0, =resultOutput
    MOV r1, r5
    MOV r2, r4
    BL printf
   
    # Pop the stack and return
    LDR lr, [sp, #0] 
    LDR r4, [sp, #4]
    ADD sp, sp, #12 
    MOV pc, lr 

.data
    promptNum: .asciz "Enter a number, or enter -1 to end the program: "
    numberFormat: .asciz "%d"
    inputNum: .word 0
    resultOutput: .asciz "The number of values entered is %d, the sum of the values is %d, and the average of the values is %d\n"

# END MAIN FUNCTION
