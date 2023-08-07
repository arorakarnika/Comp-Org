# Program Name: isNumberPrime.s
# Author: Karnika Arora
# Date: 08/06/2023
# Module 10 Assignment #2
# Purpose: Write a program to prompt the user for a number, and determine if that number is prime. 
#   Your program should print out "Number n is prime" if the number is prime, and "Number n is not prime" if the number is not prime. 
#   The user should be able to enter a "-1" to end the problem. 
#   It should print an error if 0, 1, 2 or any negative number other than -1 are entered.
# Functions: main, checkPrime
#   - main: Prompts the user for a number, and determines if that number is prime or not. Prints an error if 0, 1, 2 or any negative number other than -1 are entered. The user should be able to enter a "-1" to end the problem.
#   - checkPrime: Checks if the number is prime or not. Returns 1 if the number is prime, 0 if the number is not prime.

.global main
.global checkPrime
.text
# Start main function
main:
    # Program dictionary
    # r4 = number entered by the user

    # Push the stack
    SUB sp, sp, #12 
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    StartPromptLoop:
        # Prompt the user for a number
        LDR r0, =numberPrompt
        BL printf

        # Read the number
        LDR r0, =numberFormat
        LDR r1, =inputNum
        BL scanf

        # Store the number in r4
        LDR r4, =inputNum
        LDR r4, [r4]

        # Check if the number is -1
        CMP r4, #-1
        BEQ endPromptLoop

        # Check if the number is 0, 1, 2 or any negative number other than -1
        CMP r4, #0
        BEQ Error
        CMP r4, #1
        BEQ Error
        CMP r4, #2
        BEQ Error
        CMP r4, #-1
        BLT Error 


        # Check if the number is prime
        MOV r0, r4
        BL checkPrime // result is a bool in r0

        CMP r0, #1
        BEQ isPrime
            LDR r0, =notPrimeMessage
            MOV r1, r4
            BL printf
            B StartPromptLoop

        isPrime:
            LDR r0, =isPrimeMessage
            MOV r1, r4
            BL printf
            B StartPromptLoop


    # Print Error Message   
    Error:
        LDR r0, =printError
        MOV r1, r4
        BL printf
        B StartPromptLoop

    endPromptLoop:
            
    # Pop the stack and return
    LDR lr, [sp, #0] 
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12 
    MOV pc, lr 

.data
    numberPrompt: .asciz "Enter a number: "
    numberFormat: .asciz "%d"
    inputNum: .word 0
    printError: .asciz "Error: Please enter a number greater than 2. You entered %d\n"
    isPrimeMessage: .asciz "Number %d is prime\n"
    notPrimeMessage: .asciz "Number %d is not prime\n"

# End main function

# Start checkPrime function
# Purpose: a helper function to check if the number is prime or not, returns a boolean value: 0 if the number is not prime, 1 if the number is prime
# Parameters: r0 = number to be checked
.text
checkPrime:
    # Program dictionary
    # r4 = number entered by the user
    # r5 = counter

    # Push the stack
    SUB sp, sp, #12 
    STR lr, [sp, #0]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    # Initialize counter
    MOV r5, #2
    # Move the input number to r4
    MOV r4, r0

    # start loop to divide the number n by all numbers from 3 to n-1
    checkIfPrime:
        CMP r4, r5
        BEQ endCheckIfPrime
            MOV r1, r5
            MOV r0, r4
            BL __aeabi_idivmod // r0 has the quotient, r1 has the remainder

            CMP r1, #0 // check if the remainder is 0
            BEQ notPrime
                ADD r5, r5, #1
                B checkIfPrime

    endCheckIfPrime:
        MOV r0, #1
        B endCheckPrimeFunction
    notPrime:
        MOV r0, #0
        B endCheckPrimeFunction

    endCheckPrimeFunction:

    # Pop the stack and return
    LDR lr, [sp, #0] 
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12 
    MOV pc, lr 


.data

# End checkPrime function
