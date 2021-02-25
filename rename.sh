#!/bin/bash

for file in `ls | grep .jpg`
do
 newfile=`echo $file | sed 's/SDP-UFD-/SDP-US-/g'`
 mv $file $newfile
done