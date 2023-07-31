# Program Name: gradingProgram.s
# Author: Karnika Arora
# Date: 07/30/2023
# Module 9 Assignment #2
# Purpose: Implement a grading program as follows.  It should follow the proper style for assembly. 
#           - Prompt for a name and an average.
#           - If the average is <0 or >100,  print an error
#           - Else calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F.
#           - Print out the student's name and grade.
# Functions: main, calculateGrades

.global main
.global calculateGrades

# START MAIN FUNCTION
.text
main:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Prompt for name input
    LDR r0, =promptName
    BL printf

    // Read input name
    LDR r0, =inputFormatName
    LDR r1, =inputName
    BL scanf

    // Prompt for average input
    LDR r0, =promptAverage
    BL printf

    // Read input average
    LDR r0, =inputFormatAverage
    LDR r1, =inputAverage
    BL scanf

    // Call CalculateGrades function
    LDR r1, =inputAverage
    BL calculateGrades

    // Print grade
    MOV r2, r0 // move grade from calculateGrades function into r2
    LDR r0, =resultOutput
    LDR r1, =inputName
    BL printf

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    promptName: .asciz "Enter a the student's name: "
    promptAverage: .asciz "Enter the student's average: "
    inputFormatName: .asciz "%s"
    inputName: .space 40
    inputFormatAverage: .asciz "%d"
    inputAverage: .word 0   
    resultOutput: .asciz "Student %s has a grade of %s\n"

# END MAIN FUNCTION

# START calculateGrades FUNCTION
.text
calculateGrades:
    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Check if average is valid, raise an error if not
    MOV r0, #0
    LDR r1, [r1] // this is the inputAverage
    CMP r1, #0
    ADDGE r0, r0, #1
    MOV r2, #0
    CMP r1, #100
    ADDLE r2, r2, #1
    AND r0, r0, r2
    CMP r0, #1
    BNE printError
        # Continue if code is valid
        B endError
    printError:
        LDR r0, =errorOutput
        BL printf
        B exit
    
    endError:
    // Calculate grade if grade is valid
    MOV r0, #0 // logical value set to true if the grade is A
    CMP r1, #90
    BGE gradeA
        // Check next grade tier - B
        CMP r1, #80
        BGE gradeB
            // If false, check next grade tier - C
            CMP r1, #70
            BGE gradeC
                // if false, grade is F
                CMP r1, #70
                BLE gradeF

    gradeA:
        MOV r0, #0x41
        LDR r2, =grade
        STR r0, [r2]
        B endGrade
    gradeB:
        MOV r0, #0x42
        LDR r2, =grade
        STR r0, [r2]
        B endGrade
    gradeC:
        MOV r0, #0x43
        LDR r2, =grade
        STR r0, [r2]
        B endGrade
    gradeF:
        MOV r0, #0x46
        LDR r2, =grade
        STR r0, [r2]
        B endGrade
    endGrade:
        LDR r0, =grade


    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
    errorOutput: .asciz "Error: Average must be between 0 and 100. You entered %d\n"
    grade: .word 0
@ # END calculateGrades FUNCTION