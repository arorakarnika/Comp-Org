#!/bin/bash

while getopts n:t: flag
do
 case "${flag}" in
        n) progName=${OPTARG};;
	t) tests=(${OPTARG});;
    esac
done
shift $((OPTIND -1))
echo "Running $progName with test cases: ${tests[@]}";

for test in "${tests[@]}"; do
    echo $test | ./$progName
done
