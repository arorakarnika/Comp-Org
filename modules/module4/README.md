# Notes

- Use `make <program_name>` e.g. `make printName` to create the executable
- Vars contain a reference, identifier and a value
- By passing in the address of a variable instead of its value, it can be changed
- `BL <function_name>` branches and links the function for the program to use. e.g. `BL scanf`
  
**Components of a program**

```
.text
.global main
main:
    # Push the stack
    SUB sp, sp, #4 // Move the stack pointer (sp register) 4 bytes from the register to make space for the link register
    STR lr, [sp, #0] // Store the link register at an offset of 0 from the stack pointer

   # Insert code for the main program

    # Pop the stack and return
    LDR lr, [sp, #0] // retrieve link register from the stack
    ADD sp, sp, #4 // put the stack pointer back to where it was when we entered the method
    MOV pc, lr // Move the link register into the pc - so the program counter will receive the link register, and the program will return back to the function that called it
.data
# This is where we store the vars used by the program
```
