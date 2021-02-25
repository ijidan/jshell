#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/sbin:~/bin
export PATH

readonly LOCAL_DIR=/usr/local
readonly SRC_DIR=${LOCAL_DIR}/src
readonly LOCAL_BIN_DIR=${LOCAL_DIR}/bin
readonly CUR_DIR=`pwd`

readonly PHP_VERSION="php-5.6.25"



readonly NGINX_VERSION=""
readonly PHP_VERSION=""
readonly MYSQL_VERSION=""
readonly MEMCACHED_VERSION=""
readonly MEMCACHE_VERSION=""
readonly EACCELERATOR_VERSION=""
readonly IMAGE_MAGICK_VERSION=""
readonly OPCACHE_VERSION=""
readonly REDIS_VERSION=""
readonly XCACHE_VERSION=""
readonly SVN_VERSION="subversion-1.9.4"
readonly GEARMAN_VERSION="gearmand-1.1.12"


function isProgramInstalled(){
        _installed=`command -v $1 >/dev/null 2>&1`
        if [[ ${_installed} == ""  ]]  
        then
                return 0
        else
                return 1
        fi  
}

function isProgramRunning(){
         _ps=`pgrep $MONGOD_CMD |wc -l`
         if [ ${_ps} -eq 0 ] 
         then 
                return 1
         else
                return 0
         fi  
}

function is64Bit(){
        uname -a | grep "x86_64" 
        if [[ "$?" -eq "0" ]]
        then
                return 1
        else
                return 0
        fi  
}
function makeDir(){
        if [ ! -d $1 ]
        then
                mkdir -r $1
        fi  
}
function makeFile(){
        if [ ! -f $1 ]
        then
                touch $1
        fi  
}
function tarAndCd(){
	local file_name=$1
	local dir_name=$2
	cd ${CUR_DIR}/src
	[[ -d ${dir_name} ]] && rm -rf ${dir_name}
	echo "unpress ${file_name}"
	tar -zxvf ${$file_name}
	echo "cd ${dir_name}"
	cd ${dir_name} 	
}

function echoTip(){
        echo -e "\033[1;33m +++++++++++++++   $1  +++++++++++++++ \033[0m"
}
function checkExistAndDel(){
	if [ -f "$1" ]
	then
		echoTip "deleting file $1"
		rm "$1"
	fi
	if [ -d "$1" ]
	then
		echoTip "deleting dir $1"
		rm -rf "$1"
	fi
}
