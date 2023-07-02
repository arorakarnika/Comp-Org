#!/bin/bash

make_progs = ()
all_progs = ()
cleanfiles = ()
for prog in "$ls $1/*.s"; do
	[[ $prog =~ (.*).s ]]
    all_progs += ${BASH_REMATCH[1]}
    exec_filename = ${BASH_REMATCH[1]}
    make_progs += \
    "$exec_filename: $prog
        gcc $prog -g -c -o $exec_filename.o
        gcc $exec_filename.o -o $exec_filename"
    cleanfiles += $exec_filename
    cleanfiles += "$exec_filename.o"
done

touch $1/Makefile
echo All: ${all_progs[@]} >> $1/Makefile
echo ${make_progs[@]} >> $1/Makefile
echo \
"clean:
    rm -f ${cleanfiles[@]}" >> $1/Makefile



