#!/bin/bash

# Make all programs in dir

echo `make All`

# Run tests
../../runTests.sh -n KATempToCelsius -t "90, 95, 104"
../../runTests.sh -n KATempToF -t "32, 26, 18"
../../runTests.sh -n KAIntToNegative -t "5, 45, 10"
../../runTests.sh -n KAToInches -t "6'2\",5'5\",4'11\""
../../runTests.sh -n KAInchesToFeet -t "72, 65, 62"
