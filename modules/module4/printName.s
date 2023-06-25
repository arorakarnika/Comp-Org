.text
.global main
main:
    # push the stack
    SUB sp, sp, #4
    STR  lr, [sp, #0]
    
    # main program
    # print a prompt
    LDR r0, =prompt1
    BL printf
    
    # read in name
    LDR r0, =format1
    LDR r1, =name1
    BL scanf

    # print output
    LDR r0, =output1
    LDR r1, =name1
    BL printf
 
    # pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt1: .asciz "Please enter your name: \n"
    output1: .asciz "Your name is %s\n"
    format1: .asciz "%s"
    name1: .space 40
