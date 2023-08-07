# Program Name: guessNumber.s
# Author: Karnika Arora
# Date: 08/06/2023
# Module 10 Assignment #4
# Purpose: Write a program to guess a number chosen by the user. In this program a user will choose a secret number from 1..maximum. 
#   The program will prompt the user for the maximum value, which the user will enter. The program will then make a guess as to the value of the secret number, 
#   and prompt the user to say if the actual number is higher, lower, or correct. The computer will then guess another number until it guesses the correct secret number. 
#   The program should use a binary search to narrow its guesses to select its next guess after each attempt.
# Functions: main, guessNumber
#   - main: Prompt the user for a maximum value, and a random number in the range 1..maximum. Perform a binary search to guess the user's number.
#   - guessNumber(int startRange, int endRange): Helper function for the binary search. This function will take in the start and end of a range and return the middle of the range, 
#       along with the original start and end of the range.

.global main
.global guessNumber
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
    LDR r1, =maxNum
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
    LDR r4, =randNum
    LDR r4, [r4]

    # Check for errors with the input
    CMP r4, #1
    BLT error
        LDR r1, =maxNum
        LDR r1, [r1]
        CMP r4, r1
        BGT error
            B endError

    error:
        LDR r0, =printError
        MOV r1, r4
        MOV r2, r5
        BL printf
        B endProgram
    endError:

    # Start the search loop
    # set the start of the search to 1, end to maxNum. These numbers will be reset to perform a binary search based on user input
    MOV r6, #1
    MOV r7, r5

    startSearchLoop:
        # Guess a number by picking the middle of the range
        MOV r0, r6
        MOV r1, r7
        BL guessNumber

        # Store the guessed number in r8
        CMP r8, r0
        # if the old guess is the same as the new guess, add 1 to the guess if the user said it is higher to return the max value as a possible guess
        # if the user said it is lower, subtract 1 from the guess to return the min value as a possible guess
        BEQ sameGuess
            MOV r8, r0
            B endSameGuess
        sameGuess:
            LDR r1, =guessNum
            LDR r1, [r1]
            CMP r1, #1
            ADDEQ r8, r8, #1
            CMP r1, #2
            SUBEQ r8, r8, #1
        endSameGuess:

        # Reset the start and end of the search - the guessNumber function will return the start and end of the search in r1 and r2
        MOV r6, r1
        MOV r7, r2

        # Print the guessed number
        MOV r1, r8
        LDR r0, =printGuess
        BL printf

        # Read in user response
        LDR r0, =guessFormat
        LDR r1, =guessNum
        BL scanf

        # Load user response into r0
        LDR r0, =guessNum
        LDR r0, [r0]

        # Check the user's response. 0 = correct, 1 = higher, 2 = lower
        CMP r0, #0
        BEQ endSearchLoop
        CMP r0, #1
        BEQ higherThanGuess
            # If the input is not 1 or 0, that means the user's number is lower than our guess
            # Set the end of the search to the guess number - this narrows the search range
            MOV r7, r8
            B startSearchLoop
        higherThanGuess:
            # If the input is 1, that means the user's number is higher than our guess
            # Set the start of the search to the guess number
            MOV r6, r8
            B startSearchLoop

    endSearchLoop:
    endProgram:

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    maxPrompt: .asciz "Enter the maximum value for the number you will choose: "
    maxFormat: .asciz "%d"
    maxNum: .word 0
    randPrompt: .asciz "Pick a random number between 1 and %d: "
    randFormat: .asciz "%d"
    randNum: .word 0
    printError: .asciz "The number you entered is outside the range. You entered %d, the number should be between 1 and %d.\n"
    printGuess: .asciz "Is your number %d? If correct, enter 0. If your number is higher, enter 1. If your number is lower, enter 2: "
    guessFormat: .asciz "%d"
    guessNum: .word 0

# End main function

# Start guessNumber function
# Purpose: Helper function for the binary search
#   This function will take in the start and end of a range and return the middle of the range
# Parameters: r0 = start of range, r1 = end of range
.text
guessNumber:
    # Program dictionary
    # r4 = start of range
    # r5 = end of range
    # r6 = range = r5 - r4

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Load range from arguments into r4 and r5
    MOV r4, r0
    MOV r5, r1

    # Calculate the range and save the range in r7
    SUB r6, r5, r4

    # Calculate the middle of the range
    MOV r0, r6
    MOV r1, #2
    BL __aeabi_idivmod
    
    # Add the start of the range to the quotient to get our final guess
    ADD r0, r0, r4

    # Move the start and end of the range into r1 and r2 to be returned with our guess in r0
    MOV r1, r4
    MOV r2, r5

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 
.data

# End guessNumber function
