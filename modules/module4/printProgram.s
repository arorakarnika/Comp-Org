.text
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp]

    LDR r0, =formatString
    LDR r1, =name
    MOV r2, #27
    BL printf

    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    formatString: .asciz "Hello %s, are you %d years old?\n"
    name: .asciz "Karnika"
