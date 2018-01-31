#!/bin/bash

srcDir="./examples/"
srcFiles=$srcDir"*.heroc"

compiler="./work/lexer.py"


for i in $srcFiles; do
	file=$(basename $i);
	name=${file%.*}
	cat $i | python3.4 $compiler > $srcDir$name".s" 2> $srcDir$name".err"
	gcc -m64 -o $srcDir$name $srcDir$name".s" herocio.c
	$srcDir$name > $srcDir$name".out"
	test=`diff $srcDir$name".out" $srcDir$name".txt"`
	if [ -z $test ]; then
		echo $i "passed"
	else
		echo $i "failed"
	fi
done
