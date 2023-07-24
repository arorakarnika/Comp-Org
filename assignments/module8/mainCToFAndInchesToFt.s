# Program Name: mainCToFAndInchesToFt.s
# Author: Karnika Arora
# Date: 07/23/2023
# Module 8 Assignment #2
# Purpose: Use the CToF and InchesToFt functions from libConversions.s to convert celsius to fahrenheit and inches to feet
# Inputs: celsius: int and inches: int
# Outputs: Fahrenheit value, and feet value in feet and inches

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0]

    # Prompt for celsius
    LDR r0, =celsiusPrompt
    BL printf

    # Scan for celsius
    LDR r0, =celsiusInput
    LDR r1, =inTemp
    BL scanf

    # Call CToF
    LDR r0, =inTemp
    LDR r0, [r0]
    BL CToF

    # Print the result
    MOV r2, r0
    LDR r0, =fOutput
    LDR r1, =inTemp
    LDR r1, [r1]
    BL printf

    # Prompt for inches
    LDR r0, =inchesPrompt
    BL printf

    # Scan for inches
    LDR r0, =inchesInput
    LDR r1, =inputInValue
    BL scanf

    # Call InchesToFt
    LDR r0, =inputInValue
    LDR r0, [r0]
    BL InchesToFt

    # Print the result
    MOV r2, r0
    MOV r3, r1
    LDR r0, =ftOutput
    LDR r1, =inputInValue
    LDR r1, [r1]
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 
.data
    celsiusPrompt: .asciz "Enter a temperature (in Celsius) you'd like to convert to Fahrenheit: "
    celsiusInput: .asciz "%d"
    inTemp: .word 0
    inchesPrompt: .asciz "Enter a length (in inches) you'd like to convert to feet: "
    inchesInput: .asciz "%d"
    inputInValue: .word 0
    fOutput: .asciz "The temperature %d C in Fahrenheit is %d\n"
    ftOutput: .asciz "The length %d in in feet is %d ft and %d inches\n"