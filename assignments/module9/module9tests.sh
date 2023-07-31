#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
../../runTestsListInput.sh -n findMaxOf3 -t "100,99,1, 100,800,6, 8,8,8, 455,555,759"

echo "
------------------------------------ Running checkCharacterLogical with test cases: a, b, C, G, 9, Z ----------------------------------------------"

../../runTests.sh -n checkCharacterLogical -t "a"
../../runTests.sh -n checkCharacterLogical -t "b"
../../runTests.sh -n checkCharacterLogical -t "C"
../../runTests.sh -n checkCharacterLogical -t "G"
../../runTests.sh -n checkCharacterLogical -t "9"
../../runTests.sh -n checkCharacterLogical -t "Z"

echo "-------------------------------------------- All Tests Complete for checkCharacterLogical -----------------------------------------------------"


echo "------------------------------------ Running checkCharacter with test cases: A, b, f, h, Z, 55 ----------------------------------------------"

../../runTests.sh -n checkCharacter -t "A"
../../runTests.sh -n checkCharacter -t "b"
../../runTests.sh -n checkCharacter -t "f"
../../runTests.sh -n checkCharacter -t "h"
../../runTests.sh -n checkCharacter -t "Z"
../../runTests.sh -n checkCharacter -t "55"

echo "-------------------------------------------- All Tests Complete for checkCharacter -----------------------------------------------------"

echo "
--------------------------- Running gradingProgram with test cases: Joe: 95, Abby: 65, Vivek: 70, Tem: 81, Jenn: 0, John: -20, Frida: 810 ---------------------------"
../../runTests.sh -n gradingProgram -t "Joe, 95"
../../runTests.sh -n gradingProgram -t "Abby, 65"
../../runTests.sh -n gradingProgram -t "Vivek, 70"
../../runTests.sh -n gradingProgram -t "Tem, 81"
../../runTests.sh -n gradingProgram -t "Jenn, 0"
../../runTests.sh -n gradingProgram -t "John, -20"
../../runTests.sh -n gradingProgram -t "Frida, 810"
echo "-------------------------------------------- All Tests Complete for gradingProgram -----------------------------------------------------"

