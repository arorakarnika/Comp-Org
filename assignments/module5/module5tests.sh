#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
../../runTests.sh -n KATempToCelsius -t "90, 95, 104"
../../runTests.sh -n KATempToF -t "32, 35, 40"
../../runTests.sh -n KAIntToNegative -t "5, 45, 10"
../../runTests.sh -n KAToInches -t "6'2\", 5'5\", 4'11\""
../../runTests.sh -n KAInchesToFeet -t "72, 65, 62"
../../runTests.sh -n KAMultiplyByTen -t "3, 4, 6"
../../runTests.sh -n KASwap -t "3,2, 4,6, 7,8"
