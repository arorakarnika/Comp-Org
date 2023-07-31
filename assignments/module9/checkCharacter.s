# Program Name: checkCharacter.s
# Author: Karnika Arora
# Date: 07/30/2023
# Module 9 Assignment #1 b) - check without logical values
# Purpose: Write and test a function to  check if a user input value is a character or not.  Implement it in two ways:
#           - As a logical variable.
#           - Any way that does not use logical values.
# Functions: checkCharacter, main
# Pseudocode: if ((r1>=0x41 && r1 =< 0x5a) || (r1>=0x61 && r1 <=0x7a)) - first condition is uppercase chars, second is lowercase chars

.global main
.global checkCharacter

# START main FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Prompt for input value
    LDR r0, =prompt
    BL printf

    // Get input value
    LDR r0, =inputFormat
    LDR r1, =inputValue
    BL scanf

    // Call CheckCharacter function
    LDR r1, =inputValue
    LDR r1, [r1]
    BL checkCharacter

    // Print the result: r0 will have the result string to be printed!
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt: .asciz "Enter a value: "
    inputFormat: .asciz "%s"
    inputValue: .word 0

# END main FUNCTION

# START checkCharacter FUNCTION
.text
checkCharacter:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // First check if r1 is an uppercase character
    CMP r1, #0x41
    BGE checkLteUpper
        // if it's not greater than or equal to 0x41, it's not a character
        B notChar
    checkLteUpper:
        CMP r1, #0x5A
        BLE checkGteLower
            // if it's not less than or equal to 0x5A, it's not a character
            B isChar
    checkGteLower:
        CMP r1, #0x61
        BGE checkLteLower
            // if it's not greater than or equal to 0x61, it's not a character
            B notChar
    checkLteLower:
        CMP r1, #0x7A
        BLE isChar
            // if it's not less than or equal to 0x7A, it's not a character
            B notChar

    isChar:
        LDR r0, =resultChar
        B endCheckCharacter
    
    notChar:
        LDR r0, =resultNotChar
        B endCheckCharacter
    
    endCheckCharacter:
    // The function will return either resultChar or resultNotChar in r0 - this can be passed directly to printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    resultChar: .asciz "The value is a character.\n"
    resultNotChar: .asciz "The value is not a character.\n"

# END checkCharacter FUNCTION
