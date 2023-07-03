#!/bin/bash

make_progs=()
all_progs=()
cleanfiles=()
for prog in `ls $1/*.s`; do
	[[ "$prog" =~ .*/(.*).s$ ]]
	exec_filename="${BASH_REMATCH[1]}"
	all_progs+="${exec_filename} "
	echo "$exec_filename"
	make_progs+="
${exec_filename}: ${prog}
	gcc ${prog} -g -c -o ${exec_filename}.o
	gcc ${exec_filename}.o -o ${exec_filename}"
    	cleanfiles+="${exec_filename} "
    	cleanfiles+="${exec_filename}.o "
done

touch $1/Makefile
echo "# Do not edit: created by bash script create_makefile.sh, run bash script again to update Makefile for all programs in the directory
All: ${all_progs[@]}" > $1/Makefile
echo "${make_progs[@]}" >> $1/Makefile
echo "clean:
	rm -f ${cleanfiles[@]}" >> $1/Makefile



