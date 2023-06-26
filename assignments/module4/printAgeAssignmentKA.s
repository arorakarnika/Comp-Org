# Name: Karnika Arora
# Module 4 Assignment
# 1 - Ask a user for their age, and output it.
# June 25, 2023

.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Print prompt asking for user's age
    LDR r0, =agePrompt
    BL printf

    # Read in user inputted age
    LDR r0, =formatAge
    LDR r1, =age1
    BL scanf   

    # print output
    LDR r0, =output
    LDR r1, =age1
    LDR r1, [r1, #0]
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0]
    ADD sp, sp. #4
    MOV pc, lr

.data
    agePrompt: .asciz "Enter your age: \n"
    formatAge: .asciz "%d"
    age1: .word 0
    output: .asciz "Your age is %d"


