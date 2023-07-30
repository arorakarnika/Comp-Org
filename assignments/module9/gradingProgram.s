# Program Name: gradingProgram.s
# Author: Karnika Arora
# Date: 07/30/2023
# Module 9 Assignment #2
# Purpose: Implement a grading program as follows.  It should follow the proper style for assembly. 
#           - Prompt for a name and an average.
#           - If the average is <0 or >100,  print an error
#           - Else calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F.
#           - Print out the student's name and grade.
# Functions: main, 

.global main

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Prompt for input
    LDR r0, =prompt
    BL printf

    // Read input
    LDR r0, =inputFormat
    LDR r1, =inputName
    LDR r2, =inputAverage
    BL scanf

    // Check if average is valid, raise an error if not
    MOV r0, #0 // store the logical value to check if the input is valid in r0
    LDR r1, =inputAverage
    LDR r1, [r1]
    CMP r0, #0
    BLT error
    CMP r0, #100
    BGT error
    error:
        LDR r0, =errorOutput
        BL printf
        B exit

    // Calculate grade
    MOV r0, #0 # logical value set to true if the grade is A
    LDR r1, =inputAverage
    LDR r1, [r1]
    CMP r1, #90
    BGE gradeA

    CMP r1, #80
    BGE gradeB

    CMP r1, #70
    BGE gradeC
    CMP r1, #70
    BLE gradeF

    // Print grade
    LDR r0, =resultOutput
    LDR r1, =inputName
    LDR r1, [r1]
    LDR r2, =grade
    LDR r2, [r2]
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    prompt: .asciz "Enter a name and an average separated by a comma, e.g. 'Karnika, 90': "
    inputFormat: .asciz "%s, %d"
    inputName: .word 0
    inputAverage: .word 0
    errorOutput: .asciz "Error: Average must be between 0 and 100"
    grade: .word 0
    resultOutput: .asciz "Student %s has a grade of %c\n"

# END MAIN FUNCTION

.text
gradeA:
    MOV r0, 0x41
    LDR r1, =grade
    STR r0, [r1]

gradeB:
    MOV r0, 0x42
    LDR r1, =grade
    STR r0, [r1]

gradeC:
    MOV r0, 0x43
    LDR r1, =grade
    STR r0, [r1]

gradeF:
    MOV r0, 0x46
    LDR r1, =grade
    STR r0, [r1]