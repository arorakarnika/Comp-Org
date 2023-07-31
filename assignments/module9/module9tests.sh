#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
../../runTestsListInput.sh -n checkCharacter -t "a, B, G, 9, Z"
../../runTestsListInput.sh -n checkCharacterLogical -t "a, B, G, 9, Z"
../../runTestsListInput.sh -n findMaxOf3 -t "100,99,1, 1000,800,6, 8,8,8, 0,0,0"


echo "
------------------------------------ Running gradingProgram with test cases: Joe: 95, Abby: 65, Vivek:70, Tem: 81 ----------------------------------------------"
../../runTests.sh -n gradingProgram -t "Joe,95"
../../runTests.sh -n gradingProgram -t "Abby,65"
../../runTests.sh -n gradingProgram -t "Vivek,70"
../../runTests.sh -n gradingProgram -t "Tem,81"
echo "-------------------------------------------- All Tests Complete for mainMilesToKilometersAndKph -----------------------------------------------------"

