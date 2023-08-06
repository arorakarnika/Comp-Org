# Program Name: guessNumber.s
# Author: Karnika Arora
# Date: 08/06/2023
# Module 10 Assignment #4
# Purpose: Write a program to guess a number chosen by the user. In this program a user will choose a secret number from 1..maximum. 
#   The program will prompt the user for the maximum value, which the user will enter. The program will then make a guess as to the value of the secret number, 
#   and prompt the user to say if the actual number is higher, lower, or correct. The computer will then guess another number until it guesses the correct secret number. 
#   The program should use a binary search to narrow its guesses to select its next guess after each attempt.

.global main
.text
# Start main function
main:
    # Program dictionary
    # r4 = guessNum (number picked by the user)
    # r5 = maxNum
    # r6 = startSearch
    # r7 = endSearch
    # r8 = guess

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Prompt user for maximum value
    LDR r0, =maxPrompt
    BL printf

    # Read in the max value
    LDR r0, =maxFormat
    LDR r1, -maxNum
    BL scanf

    # Store the max value in r5
    LDR r5, =maxNum
    LDR r5, [r5]

    # Ask the user to guess a number
    LDR r0, =randPrompt
    LDR r1, =maxNum
    LDR r1, [r1]
    BL printf

    # Read in the guess
    LDR r0, =randFormat
    LDR r1, =randNum
    BL scanf

    # Store the number in r4
    LDR r4, =guessNum
    LDR r4, [r4]

    # Check for errors
    CMP r4, #1
    BLT error
    LDR r1, =maxNum
    LDR r1, [r1]
    CMP r4, r1
    BGT error

    # Start the search loop
    # set the start of the search to 1, end to maxNum. These numbers will be reset to perform a binary search based on user input
    MOV r6, #1
    MOV r7, r5

    startSearchLoop:
        # Pick a random number between the starting number and maxNum.
        LDR r0, [r6]
        LDR r1, [r7]
        BL rand

        # Store our guess in r8
        MOV r8, r0

        # Print the random number
        LDR r1, [r8]
        LDR r0, =printGuess
        BL printf

        # Read in user response
        LDR r0, =guessFormat
        LDR r1, =guessNum
        BL scanf

        # Condition
        CMP r0, #0
        BEQ endProgram
        CMP r0, #1
        BEQ higherThanGuess
            # If the input is not 1 or 0, that means the user's number is lower than our guess
            # Set the end of the search to the guess number
            MOV r7, r8
            B startSearchLoop
        higherThanGuess:
            # If the input is 1, that means the user's number is higher than our guess
            # Set the start of the search to the guess number
            MOV r6, r8
            B startSearchLoop

    error:
        LDR r0, =printError
        MOV r1, r4
        MOV r2, r5
        BL printf
        B endProgram

    endProgram:

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    maxPrompt: .asciz "Enter the maximum value for the number you will choose:"
    maxFormat: .asciz "%d"
    maxNum: .word 0
    randPrompt: .asciz "Pick a random number between 1 and %d:"
    randFormat: .asciz "%d"
    randNum: .word 0
    printError: .asciz "The number you entered is outside the range. You entered %d, the number should be between 1 and %d."
    printGuess: .asciz "Is your number %d? If correct, enter 0. If your number is higher, enter 1. If your number is lower, enter 2."
    guessFormat: .asciz "%d"
    guessNum: .word 0

# End main function
