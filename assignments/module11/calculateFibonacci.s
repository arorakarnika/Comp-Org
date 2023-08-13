# Program Name: calculateFibonacci.s
# Author: Karnika Arora
# Date: 08/13/2023
# Module 11 Assignment #2
# Purpose: Implement a program to calculate a Fibonacci number recursively.
# A Fibonacci number is defined mathematically as:
#          F(n) = F(n-1) + F(n-2)  where n>=0, F(0)=0, F(1)=1

.global main
.global calculateFibonacci

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

    # Call calculateFibonacci function
    LDR r0, =inputNum
    LDR r0, [r0]
    BL calculateFibonacci

    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    numPrompt: .asciz "Enter a number to get the fibonacci number: "
    numFormat: .asciz "%d"
    inputNum: .word 0
    resultPrompt: .asciz "The fibonacci number at that index is: %d\n"

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
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Check if n == 0
    CMP r0, #0
    BEQ returnZero
        CMP r0, #1
        BEQ returnOne
            B fibonacciLoop
    
    fibonacciLoop:
    SUB r1, r0, #1
    SUB r2, r0, #2
    ADD r0, r1, r2
    BL calculateFibonacci
    B returnResult
    endLoop:

    returnZero:
    MOV r0, #0
    B returnResult

    returnOne:
    MOV r0, #1
    B returnResult
    
    returnResult:
    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 


.data

# END calculateFibonacci FUNCTION
