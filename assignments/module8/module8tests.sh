#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
echo "
------------------------------------ Running mainCToFAndInchesToFt with test cases: 45c 60in, 30c 70in, 14c 50in ----------------------------------------------"
../../runTests.sh -n mainCToFAndInchesToFt -t '45 60'
../../runTests.sh -n mainCToFAndInchesToFt -t '30 70' 
../../runTests.sh -n mainCToFAndInchesToFt -t '14 50'
echo "-------------------------------------------- All Tests Complete for mainCToFAndInchesToFt -----------------------------------------------------"

echo "
------------------------------------ Running mainMilesToKilometersAndKph with test cases: 120mi 2h, 500mi 8h, 450mi 10h ----------------------------------------------"
../../runTests.sh -n mainMilesToKilometersAndKph -t "120,2"
../../runTests.sh -n mainMilesToKilometersAndKph -t "500,8"
../../runTests.sh -n mainMilesToKilometersAndKph -t "450,10"
echo "-------------------------------------------- All Tests Complete for mainMilesToKilometersAndKph -----------------------------------------------------"

