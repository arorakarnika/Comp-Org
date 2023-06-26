# Name: Karnika Arora
# Module 4 Assignment
# 5 - Extra Credit - Input a floating point and print it out of the program.  
# Note: the %f that scanf uses is a float (32 bits), and the %f that printf uses is a double (64 bits).  
# June 25, 2023

.text
.global main
main:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Print prompt asking for float input
    LDR r0, =floatPrompt
    BL printf

    # Read in user inputted float number
    LDR r0, =formatf
    LDR r1, =inFloat
    BL scanf   

    # Print the float
    LDR r0, =formatString
    LDR r1, =inFloat
    VLDR s0, [r1] // Load float from r1 into s0
	vcvt.f64.f32 d7, s0  // convert value at s0 to double in d7
    vmov r1, r2, d7 // move double in d7 into r1 and r2 (need two registers for a double)
    BL printf

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
.data
    floatPrompt: .asciz "Please enter a float: \n"
    formatf: .asciz "%f"
    formatString: .asciz "Here is a float: %f\n"
    inFloat: .float 0.0

