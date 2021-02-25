#!/bin/bash


readonly PDF_PATH="/vagrant/pdf"

#遍历文件
function scanDir() {
for file in ./*
do
    if test -f $file
    then
        echo $file 是文件
    else
        echo $file 是目录
    fi
done
}
