# Program Name: checkCharacter.s
# Author: Karnika Arora
# Date: 07/30/2023
# Module 9 Assignment #1
# Purpose: Write and test a function to  check if a user input value is a character or not.  Implement it in two ways:
#           - As a logical variable.
#           - Any way that does not use logical values.
# Functions: logicalCheckCharacter, main
# Pseudocode: if ((r1>=0x41 && r1 =< 0x5a) || (r1>=0x61 && r1 <=0x7a)) - first condition is uppercase chars, second is lowercase chars

.global logicalCheckCharacter
.global main
# START MAIN FUNCTION
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

    // Call logicalCheckCharacter function
    LDR r1, =inputValue
    LDR r1, [r1]
    BL logicalCheckCharacter

    // Print the result
    CMP r2, #1 // check if the response from logicalCheckCharacter is true
    LDRNE r0, =resultNotChar // if not, print that the value is not a character
    LDREQ r0, =resultChar // if true, print that the value is a character
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt: .asciz "Enter a value: "
    inputFormat: .asciz "%s"
    inputValue: .word 0
    resultChar: .asciz "The value is a character.\n"
    resultNotChar: .asciz "The value is not a character.\n"


# END MAIN FUNCTION

# START logicalCheckCharacter FUNCTION
.text
logicalCheckCharacter:
// Inputs: r1 - the value to check if it's a character or not

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 
    
    // First check if r1 is an uppercase character. The logical value will be stored in r2
    MOV r2, #0
    CMP r1, #0x41
    ADDGE r2, #1 // if r1 is greater than or equal to 0x41, bit 0 is changed to 1 to represent a true value

    MOV r3, #0
    CMP r1, #0x5A
    ADDLE r3, #1
    AND r2, r2, r3 // if r1 is between 0x41 and 0x5a, r2 is set to True (this is the hex range for lowercase characters)

    // Next, check if r1 is a lowercase character. The logical value will be stored in r3
    MOV r3, #0
    CMP r1, #0x61 // this is the start of the hex range for lowercase characters
    ADDGE r3, #1 // set r3 to true if r1 is greater than or equal to 0x61

    MOV r0, #0
    CMP r1, #0x7A
    ADDLE r0, #1 // set r0 to true if r1 is less than or equal to 0x7A
    AND r3, r3, r0 // if true r1 is lowercase
    ORR r2, r2, r3 // if true r1 is a character, return value will be in r2

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data

# END logicalCheckCharacter FUNCTION

