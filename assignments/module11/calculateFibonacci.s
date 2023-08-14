# Program Name: calculateFibonacci.s
# Author: Karnika Arora
# Date: 08/13/2023
# Module 11 Assignment #2
# Purpose: Implement a program to calculate a Fibonacci number recursively.
# A Fibonacci number is defined mathematically as:
#          F(n) = F(n-1) + F(n-2)  where n>=0, F(0)=0, F(1)=1
# Functions: main, calculateFibonacci
#   - main: prompts user for input, checks input to make sure it is positive, calls calculateFibonacci, prints result
#   - calculateFibonacci(int n: r0): calculates the fibonacci number recursively and returns it in r0 


.global main

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Prompt user for input
    LDR r0, =numPrompt
    BL printf

    # Get user input
    LDR r0, =numFormat
    LDR r1, =inputNum
    BL scanf

    # Check for negative input
    LDR r0, =inputNum
    LDR r0, [r0]
    CMP r0, #0
    BLT negativeInput
        B endNegativeInput
    
    negativeInput:
        LDR r0, =badInput
        LDR r1, =inputNum
        LDR r1, [r1]
        BL printf
        B Return
    endNegativeInput:

    # Call calculateFibonacci function
    LDR r0, =inputNum
    LDR r0, [r0]
    BL calculateFibonacci

    # Print result
    MOV r2, r0
    LDR r0, =resultPrompt
    LDR r1, =inputNum
    LDR r1, [r1]
    BL printf
    B Return

    Return:
    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    numPrompt: .asciz "Enter a number to get the fibonacci number: "
    numFormat: .asciz "%d"
    inputNum: .word 0
    resultPrompt: .asciz "The fibonacci number f(%d) is: %d\n"
    badInput: .asciz "Negative fibonacci numbers are not supported by this program, %d is not valid input. Please enter a positive integer.\n"

# END MAIN FUNCTION

# START calculateFibonacci FUNCTION
# Parameters: r0 = n
# Pseudocode (python):
@ def fibonacci(n):
@     if n == 0:
@         return 0
@     if n == 1:
@         return 1
@     else:
@         return fibonacci(n-1) + fibonacci(n-2)
    
@ if __name__ == '__main__':
@     n = int(input("Enter a number: "))
@     result = fibonacci(n)
@     print(result)

.text
calculateFibonacci:
    # Push the stack
    SUB sp, sp, #12
    STR lr, [sp, #0]
    STR r4, [sp, #4] // save n in r4, this will preserve n across recursive calls
    STR r5, [sp, #8] // create space for n-1 so it's preserved across recursive calls in r5
    # Move n to r4
    MOV r4, r0

    # Check if n == 0
    CMP r4, #0
    BEQ returnZero
        B endReturnZero

    returnZero:
        MOV r0, #0
        B returnResult
    endReturnZero:

    CMP r4, #1
    BEQ returnOne
        B endReturnOne
    
    returnOne:
        MOV r0, #1
        B returnResult
    endReturnOne:
    
    SUB r1, r4, #1
    MOV r0, r1
    BL calculateFibonacci // calculate f(n-1)
    MOV r5, r0 // store f(n-1) in r5
    SUB r0, r4, #2 // calculate n-2
    BL calculateFibonacci // calculate f(n-2)
    ADD r0, r0, r5 // add f(n-1) and f(n-2)
    B returnResult

    returnResult:

    # Pop the stack
    LDR lr, [sp, #0] 
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12 
    MOV pc, lr 


.data
    num: .word 0

# END calculateFibonacci FUNCTION
