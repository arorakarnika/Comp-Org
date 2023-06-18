# Compile, Link and Go (Notes)

To comple the assembly program, use this command to create a .o or "object" file:
`gcc HelloWorld.s -c -o HelloWorld.o`

To link and create an executable, use:
`gcc HelloWorld.o -o HelloWorld`

To run the program:
`./HelloWorld`

Other notes about `gcc`:
- The `-g` option will output debugging info, usage e.g.: `gcc HelloWorld.s -g -c -o HelloWorld.o`
- The `-c` option tells the assembler to assemble the code into an object file but not create an executable for it

## Module 3: Required Reading

Textbook: Kann, Charles W., "Introduction to Assembly Language Programming: From Soup to Nuts: ARM Edition" (2021). Open Textbooks. 8.
https://cupola.gettysburg.edu/oer/8 Links to an external site., Sections 3.1.1 – 3.1.3
Optional Reading

## Module 3: Unix Material (Optional)

- Tutorial: https://www.tutorialspoint.com/unix/unix-file-system.htm Do the Unix/Linux for Beginners section.
- Tutorial: http://www.ee.surrey.ac.uk/Teaching/Unix/ (for those wanting more information, all quiz questions will be taken from first tutorial)
- Web Site: https://www.geeksforgeeks.org/unix-file-system/ Links to an external site.
- Tutorial: run vimtutor on your Rasperberry Pi. Do all sections up to 4.3

## Module 3: Assembly Language (Optional)

Web Site: https://azeria-labs.com/writing-arm-assembly-part-1/ Links to an external site.
Web Site: https://thinkingeek.com/arm-assembler-raspberry-pi/ Links to an external site.

