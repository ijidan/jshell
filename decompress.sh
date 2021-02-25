#!/bin/bash

#.tar file decompress
[ echo "$1" | grep -Ei "\.tar$" ] && tar -xvf $1 && exit 1

#.tar.gz , .tgz | .gz  file decompress
[ echo "$1" | grep -Ei "(\.tar\.gz$|\.tgz$)"  ] && tar  -zxvf $1 && exit 1
[ echo "$1" | grep -Ei "\.gz$" ]  && gunzip $1 && exit 1

#.tar.bz2 | .bz2 file decompress
[ echo "$1" | grep -Ei "\.tar\.bz2$" ] && tar -jxvf $1 && exit 1
[ echo "$1" | grep -Ei "\.bz2$" ] && bunzip2 -k  $1 && exit 1

#.tar.Z | .Z file decompress
[ echo "$1" | grep -E "\.tar.Z$" ] && tar -Zxvf $1 && exit 1
[ echo "$1" | grep -E  "\.Z$" ]  && uncompress $1 && exit 1

#.rar file decompress
[ echo "$1" | grep -Ei "\.rar$" ] && unrar e $1 && exit 1

#.zip file decompress
[ echo "$1" | grep -Ei "\.zip$" ]         && unzip $1 && exit 1 
