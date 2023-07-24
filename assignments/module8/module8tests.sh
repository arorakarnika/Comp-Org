#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
../../runTests.sh -n mainCToFAndInchesToFt -t '45 60'
../../runTests.sh -n mainCToFAndInchesToFt -t '30 70' 
../../runTests.sh -n mainCToFAndInchesToFt -t '14 50'
../../runTests.sh -n mainMilesToKilometersAndKph -t "120,2"
../../runTests.sh -n mainMilesToKilometersAndKph -t "500,8"
../../runTests.sh -n mainMilesToKilometersAndKph -t "450,8"