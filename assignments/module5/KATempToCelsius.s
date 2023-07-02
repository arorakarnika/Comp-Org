# Name: Karnika Arora
# Module 5 Assignment
# 1a) A program to convert temperature for celsius to Fahrenheit
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

    # Read in the entered temperature, can be a float
    LDR r0, =formatInput
    LDR r1, =inFloat
    BL scanf

    # Convert the input to Celsius
    
    # subtract 32 from input 
    LDR r0, =tempResult
    LDR r1, =inFloat
    VLDR s0, [r1] // Load float from r1 into s0
    SUB r0, s0, #32

    # multiply by 5
    LDR r0, =tempResult
    MUL r0, r0, #5

    # divide by 9
    LDR r0, =tempResult  
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
    formatInput: .asciz "%f"
    inFloat: .float 0.0
    tempResult: .float 0.0
    resultOutput: .asciz "The temperature in Celsius is %f\n"
    