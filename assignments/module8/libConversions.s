# Program Name: libConversions.s
# Author: Karnika Arora
# Date: 07/23/2023
# Module 8 Assignment
# Purpose: Create a library of functions for use by other programs
# Functions: miles2kilometer(int miles), kph(int hours, int miles)
# Inputs: (when applicable)
# Outputs: (when applicable)

.global miles2kilometer
.global kph

.text

# START miles2kilometer

# Create a function miles2kilometer that takes a number of miles and returns the number of kilometers
# The function will multiply the number of miles by 161 and then divide by 100 to get the number of kilometers
# This is done for simplicity and to avoid using floating point numbers, we would achieve greater precision by multiplying by 1.61

miles2kilometer:

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Multiply miles by 161
    MOV r1, #161
    MUL r0, r0, r1

    // Divide the result by 100
    MOV r1, #100
    BL __aeabi_idiv

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
# END miles2kilometer

# START kph

# Create a function kph that takes a number of hours and a number of miles and returns the number of kilometers per hour
# The function will call miles2kilometer to convert the number of miles to kilometers

.text
kph:

    # Push the stack
    SUB sp, sp, #4 
    STR lr, [sp, #0] 

    // Convert miles to kilometers using miles2kilometer function
    // The input miles is in r0
    MOV r2, r1 // move the second input value, hours, into r2
    BL miles2kilometer // result will be in r0

    // Divide kilometers by hours
    // hours is the input in r1
    MOV r1, r2
    BL __aeabi_idiv

    # Pop the stack and return
    LDR lr, [sp, #0] 
    ADD sp, sp, #4 
    MOV pc, lr 

.data
# END kph
