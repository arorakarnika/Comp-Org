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
    LDR r1, [r1, #0] // values are needed for int vars - this loads into r1 the value stored at the address for num1
    BL printf

    # pop stack and return
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data
    prompt1: .asciz "Enter your age: \n"
    format1: .asciz "%d"
    num1: .word 0 // initializes to 0
    output1: .asciz "You are %d years old\n"
