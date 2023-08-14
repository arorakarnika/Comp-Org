#!/bin/bash
# Author: Karnika Arora

# Make all programs in the current directory
echo `make All`

# Run tests, runTests.sh should be two directories up from the current directory
../../runTestsListInput.sh -n recursiveMultiply -t "5,4, 90,10, 7,45, -1,9, 0,4"
../../runTestsListInput.sh -n calculateFibonacci -t "5, 4, 10, 19, 17, 0, 1, -3"
