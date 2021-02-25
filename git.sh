#!/bin/bash

readonly PROGRAM_NAME=git
program_installed=0
LD_IFS="$IFS" 
IFS=":" 
path_arr=($PATH) 
IFS="$OLD_IFS" 
for path_item in ${path_arr[@]} 
do   
    if [ -f $path_item/$PROGRAM_NAME ]
        then   
                program_installed=1
                break   
    fi
done

if [ $program_installed  -eq 1 ]
then
   echo "$PROGRAM_NAME has installed"
   exit
fi

FILE_URL=https://www.kernel.org/pub/software/scm/git
FILE_DIR=git-2.9.3
FILE_NAME=$FILE_DIR.tar.gz
LOCAL_DIR=/usr/local
SRC_DIR=$LOCAL_DIR/src

cd $SRC_DIR
if [ ! -f $SRC_DIR/$FILE_NAME ]
then
	wget $FILE_URL/$FILE_NAME
fi
if [ ! -d $SRC_DIR/$FILE_DIR ]
then
	tar -zxvf $SRC_DIR/$FILE_NAME
fi

cd $SRC_DIR/$FILE_DIR
./configure --prefix=$LOCAL_DIR/FILE_DIR
make && make install


