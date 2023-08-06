# Program Name: isNumberPrime.s
# Author: Karnika Arora
# Date: 08/06/2023
# Module 10 Assignment #2
# Purpose: Write a program to prompt the user for a number, and determine if that number is prime. 
#   Your program should print out "Number n is prime" if the number is prime, and "Number n is not prime" if the number is not prime. 
#   The user should be able to enter a "-1" to end the problem. 
#   It should print an error if 0, 1, 2 or any negative number other than -1 are entered.

.global main
.text
# Start main function
main:
    # Program dictionary
    # r4 = number entered by the user
    # r5 = counter

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

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
        BEQ endProgram

        # Check if the number is 0, 1, 2 or any negative number other than -1
        CMP r4, #0
        BLT Error
        CMP r4, #1
        BEQ Error
        CMP r4, #2
        BEQ Error
        CMP r4, #-1
        BLT Error 

        # Check if the number is prime
        # Start counter
        MOV r5, #2
        checkPrime:
            # Exit condition
            CMP r5, r4
            BEQ isPrime

            MOV r0, r4
            MOV r1, r5
            BL __aeabi_idivmod
            CMP r1, #0 // check if the remainder is 0
            BEQ notPrime
            ADD r1, r1, #1 // increment the counter and divide by the next number
            MOV r5, r1
            B checkPrime
 
    # Print Error Message   
    Error:
        LDR r0, =printError
        MOV r1, r4
        BL printf
        B endProgram

    isPrime:
        LDR r0, =isPrimeMessage
        MOV r1, r4
        BL printf
        B endProgram
    
    notPrime:
        LDR r0, =notPrimeMessage
        MOV r1, r4
        BL printf
        B endProgram
    
    endProgram:
            
    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    numberPrompt: .asciz "Enter a number: "
    numberFormat: .asciz "%d"
    inputNum: .word 0
    printError: .asciz "Error: Please enter a number greater than 2. You entered %d\n"
    isPrimeMessage: .asciz "Number %d is prime\n"
    notPrimeMessage: .asciz "Number %d is not prime\n"

# End main function
