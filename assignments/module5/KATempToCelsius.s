# Name: Karnika Arora
# Module 5 Assignment
# Date: 07/02/2023
# 1a) A program to convert temperature from Celsius to Fahrenheit
# 1 - implement two programs, one to convert temperature from degree Celsius to Fahrenheit, and one to do 
# Fahrenheit to Celsius.  The formulas for this are: F = (C * 9/5) + 32 and C = (F - 32) * 5/9.  
# (Hint: make sure your order of operations is correct, and multiplication is always done before division).

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 // Move the stack pointer (sp register) 4 bytes from the register to make space for the link register
    STR lr, [sp, #0] // Store the link register at an offset of 0 from the stack pointer

    # Print a prompt for the temperature
    LDR r0, =inputPrompt
    BL printf

    # Read in the entered temperature
    LDR r0, =formatInput
    LDR r1, =inTemp
    BL scanf

    # Convert the input to Celsius
    
    # subtract 32 from input 
    LDR r1, =inTemp
    LDR r2, [r1] // Load the integer value into r2 from the address at r1
    SUB r2, r2, #32 // subtract 32 from the int and store the result in r2

    # multiply by 5
    MOV r1, r2
    MOV r3, #5
    MUL r2, r1, r3

    # divide by 9
    MOV r0, r2
    MOV r1, #9
    BL __aeabi_idiv    

    # print result
    MOV r1, r0
    LDR r0, =resultOutput
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] // retrieve link register from the stack
    ADD sp, sp, #4 // put the stack pointer back to where it was when we entered the method
    MOV pc, lr // Move the link register into the pc - so the program counter will receive the link register, and the program will return back to the function that called it
.data
    inputPrompt: .asciz "Enter a temperature (in Fahrenheit) you'd like to convert to Celsius:\n"
    formatInput: .asciz "%d"
    inTemp: .word 0
    resultOutput: .asciz "The temperature in Celsius is %d\n"
    
