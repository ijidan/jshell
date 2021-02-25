#!/bin/bash


function testReturn(){
	if test true
	then
		return 0
	else
		return 0

	fi
}
testReturn
if [ testReturn ]
then
	echo "100"
else
	echo "0"
fi
