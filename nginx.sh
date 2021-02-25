#!/bin/bash

readonly DIR_NAME=nginx-1.10.1
readonly FILE_NAME=${DIR_NAME}.tar.gz

URL="http://nginx.org/download/nginx-1.10.1.tar.gz"

function _install(){
	isProgramInstalled nginx
        if [[ "$?" -eq "1" ]]
        then
                echo "mongodb has been installed" && exit 1
        fi      
        
        cd $SRC_DIR
        
        if [ ! -f "$FILE_NAME" ]
        then 
                wget https://fastdl.mongodb.org/linux/${FILE_NAME}
        fi      
        
        if [ ! -d "$LOCAL_DIR/$DIR_NAME" ]
        then 
                tar -zxvf $FILE_NAME -C $LOCAL_DIR
        fi      
        makeDir /data/db
        makeDir /data/mongo_log
        
        ln -sf ${LOCAL_DIR}/bin/mongod          ${LOCAL_BIN_DIR}/mongod
        ln -sf ${LOCAL_DIR}/bin/mongo           ${LOCAL_BIN_DIR}/mongo
        ln -sf ${LOCAL_DIR}/bin/bsondump        ${LOCAL_BIN_DIR}/bsondump
        ln -sf ${LOCAL_DIR}/bin/mongodump       ${LOCAL_BIN_DIR}/mongodump
        ln -sf ${LOCAL_DIR}/bin/mongoexport     ${LOCAL_BIN_DIR}/mongoexport
        ln -sf ${LOCAL_DIR}/bin/mongofiles      ${LOCAL_BIN_DIR}/mongofiles
        ln -sf ${LOCAL_DIR}/bin/mongoimport     ${LOCAL_BIN_DIR}/mongoimport
        ln -sf ${LOCAL_DIR}/bin/mongooplog      ${LOCAL_BIN_DIR}/mongooplog
        ln -sf ${LOCAL_DIR}/bin/mongoperf       ${LOCAL_BIN_DIR}/mongoperf
        ln -sf ${LOCAL_DIR}/bin/mongorestore    ${LOCAL_BIN_DIR}/mongorestore
        ln -sf ${LOCAL_DIR}/bin/mongos          ${LOCAL_BIN_DIR}/mongos
        ln -sf ${LOCAL_DIR}/bin/mongostat       ${LOCAL_BIN_DIR}/mongostat
        ln -sf ${LOCAL_DIR}/bin/mongotop        ${LOCAL_BIN_DIR}/mongotop

}

function _uninstall(){

}

function _start(){
	isProgramRunning nginx
	if [[ "$?" -eq "1"  ]]
	then
		echo "nginx is running"
		exit 1
	fi
	nginx
	if [[ "$?" -eq "0"  ]]
	then
		echo "nginx is running"
	else
		echo "nginx start failed"
	if
}
function _stop(){
	isProgramRunning nginx
	if [[ "$?" -eq "0" ]]
	then
		echo "nginx is not running"
		exit 1
	fi

	nginx -s stop
	if [[ "$?" -eq "0"  ]]
	then
		echo "nginx stopped"
	else
		echo "nginx stop failed"
	fi
}
case $1 in
        "install")
                _install;;
        "uninstall")
                _uninstall;;
        "start")
                _start;;
        "stop")
                _stop;;
        *)  
                echo "option:"
                echo "install           install mongodb"
                echo "uninstall         uninstall mongdb "
                echo "start             start mongodb as daemon"
                echo "stop              stop mongdb"
esac
