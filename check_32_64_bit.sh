#/bin/bash

source ./common.sh

is64Bit

if [[ $? -eq 1 ]]
then
	echo "64 bit"
else
	echo "32 bit"
fi
