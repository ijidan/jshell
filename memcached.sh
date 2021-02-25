#!/bin/bash

source ./common.sh

case $1 in 
	"install")
		install ;;
	"uninstall")
		install ;;
	"start")
		start ;;
	"stop")
		stop ;;
esac
function install(){

	is_installed=`isProgramInstalled memcached`
	if [ ${is_installed}==0 ]
	then
		echo "memcached has been installed"
		exit 1 

	local readonly FILE_PATH=memcached-1.4.31
	local readonly FILE_NAME=${FILE_DIR}.tar.gz

	cd $SRC_PATH
	wget http://memcached.org/files/${FILE_NAME}
	tar -zxvf ${FILE_NAME}
	cd ${FILE_PATH}
	./configure --prefix=${LOCAL_PATH}/${FILE_PATH}
	make && make install

	cd /usr/local/bin
        ln -sf ${LOCAL_PATH}/${FILE_PATH}/bin/memcached memcached
}

function start(){
	/usr/local/memcached-1.2.0/bin/memcached -d -m 128 -l 127.0.0.1 -p 11211 -u root
	if [ $1==0 ]
	then 
		echo "memcached started"
	else
		echo "memcached start failed"
}
function stop(){
}
function uninstall(){
}
