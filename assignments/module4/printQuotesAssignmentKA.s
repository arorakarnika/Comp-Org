# Name: Karnika Arora
# Module 4 Assignmnent
# 3 - Put quotes in a formated string.
# June 25, 2023

.text
.global main
main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Print quoteString
    LDR r0, =quoteString
    BL printf

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data
    quoteString: .asciz "The program name is \"printQuotesAssignment\"\n"
