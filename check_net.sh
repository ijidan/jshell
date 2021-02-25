#!/bin/bash

ping -c 5 www.baidu.com

if [ $? -eq 0 ]
then
	echo "network right"
else
	echo "network wrong"
fi

#http_code= `curl -I www.baidu.com -w %{http_code} | tail -n1`
#echo $http_code
