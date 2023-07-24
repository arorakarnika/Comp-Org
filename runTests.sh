#!/bin/bash
# Author: Karnika Arora
# This script should be called with the -n and -t flags e.g. ./runTests.sh -n <prog_name> -t <test_cases>
# This script currently only works with single input test cases, and may be updated in the future to support multiple inputs

while getopts n:t: flag
do
 case "${flag}" in
        n) progName=${OPTARG};;
	t) tests=${OPTARG};;
    esac
done
shift $((OPTIND -1))
echo "
------------------------------------ Running $progName with test cases: ${tests[@]} ----------------------------------------------"

for test in "${tests[@]}"; do
    echo $test | ./$progName
done
echo "-------------------------------------------- All Tests Complete for $progName -----------------------------------------------------"
