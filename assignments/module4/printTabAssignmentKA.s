# Name: Karnika Arora
# Module 4 Assignmnent
# 2 - Output a string with tabs between the number you output and the characters before and after it.
# June 25, 2023

.text
.global main
main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    # Prompt the user to enter an integer
    LDR r0, =prompt1
    BL printf

    # Read in the input value
    LDR r0, =format1
    LDR r1, =num1
    BL scanf 

    # print output
    LDR r0, =output1
    LDR r1, =num1
    LDR r1, [r1, #0]

    # pop stack and return
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt1: .asciz "Enter a number: \n"
    format1: .asciz "%d"
    num1: .word 0 
    output1: .asciz "This is a string with tabs before your number:\t%d\t and after it\n"
