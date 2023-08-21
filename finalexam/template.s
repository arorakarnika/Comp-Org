# Program Name: 
# Author: Karnika Arora
# Date: 08/20/2023
# Final Exam
# Purpose: 
# Functions: 

.global main

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    # Prompt the user for input
    LDR r0, =promptOne
    BL printf

    # Pop the stack
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    promptOne: .asciz "Enter input: "

# END MAIN FUNCTION
