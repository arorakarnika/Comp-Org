# Program Name: recursiveMultiply.s
# Author: Karnika Arora
# Date: 08/13/2023
# Module 11 Assignment #1
# Purpose: Implement a program to calculate multiplication using successive addition with recursion. For example, 5x4 is 5+5+5+5.  This can be defined recursively as:
#            Mult(m, n) = if n is 1,  return m
#                              else return m + Mult(m, n-1)

.global main
.global recursiveMul

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Prompt the user for input
    LDR r0, =numPrompt
    BL printf

    # Get the user input
    LDR r0, =inputFormat
    LDR r1, =num1
    LDR r2, =num2
    BL scanf

    # Call the recursiveMul function
    LDR r0, =num1
    LDR r0, [r0]
    LDR r1, =num2
    LDR r1, [r1]
    MOV r2, #0 // initialize a result variable to add to in the recursiveMul function
    BL recursiveMul // result in r0

    # Print the result
    MOV r3, r0
    LDR r0, =result
    LDR r1, =num1
    LDR r1, [r1]
    LDR r2, =num2
    LDR r2, [r2]
    BL printf

    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    numPrompt: .asciz "Enter two numbers to multiply, separated by a comma e.g. 5,4: "
    inputFormat: .asciz "%d,%d"
    num1: .word 0
    num2: .word 0
    result: .asciz "The result of %d x %d is %d\n"

# END MAIN FUNCTION

# START recursiveMul FUNCTION
# Parameters: r0 = num1, r1 = num2
# Pseudocode (python):
@ def recursiveMul(num1, num2):
@     if num2 == 0:
@         return 0
@     else:
@         return num1 + recursiveMul(num1, num2 - 1)

@ if __name__ == '__main__':
@     num1 = int(input("Enter a number: "))
@     num2 = int(input("Enter a number: "))
@     result = recursiveMul(num1, num2)
@     print(result)

.text
recursiveMul:
    # Program dictionary:
    # r0 = num1
    # r1 = num2
    # r2 = result (starts at 0)

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Check if num2 is 0
    CMP r1, #0
    BEQ Return
        B elseLoop
    elseLoop:
    SUB r1, r1, #1
    ADD r2, r2, r0
    BL recursiveMul
    endElseLoop:
    
    Return:
    MOV r0, r2 // move the result into r0 before returning
    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 


.data

# END recursiveMul FUNCTION
