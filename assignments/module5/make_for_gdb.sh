#!/bin/bash
gcc $1.s -g -c -o $1.o
gcc $1.o -o $1

