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
    SUB sp, sp, #4 # Move the stack pointer (sp register) 4 bytes from the register to make space for the link register
    STR lr, [sp, #0] # Store the link register at an offset of 0 from the stack pointer

   # Read in input temperature to convert
   LDR r0, =inputPrompt


    # Pop the stack and return
    LDR lr, [sp, #0] # retrieve link register from the stack
    ADD sp, sp, #4 # put the stack pointer back to where it was when we entered the method
    MOV pc, lr # Move the link register into the pc - so the program counter will receive the link register, and the program will return back to the function that called it
.data
    inputPrompt: .asciz "Enter a temperature you'd like to convert to Celsius:\n"