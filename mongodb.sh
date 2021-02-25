#/bin/bash

source ./common.sh

is64Bit
if [[ "$?" -eq "1"  ]]
then
	readonly DIR_NAME=mongodb-linux-x86_64-rhel62-3.2.9
	readonly FILE_NAME=${DIR_NAME}.tgz
else
	readonly DIR_NAME=mongodb-linux-i686-3.2.9
	readonly FILE_NAME=${DIR_NAME}.tgz
fi
function _install(){
	isProgramInstalled mongod
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
	#makeDir -r /data/db
	#makeDir -r/data/mongo_log
	
	ln -sf ${LOCAL_DIR}/bin/mongod		${LOCAL_BIN_DIR}/mongod
	ln -sf ${LOCAL_DIR}/bin/mongo		${LOCAL_BIN_DIR}/mongo
	ln -sf ${LOCAL_DIR}/bin/bsondump	${LOCAL_BIN_DIR}/bsondump
	ln -sf ${LOCAL_DIR}/bin/mongodump	${LOCAL_BIN_DIR}/mongodump
	ln -sf ${LOCAL_DIR}/bin/mongoexport	${LOCAL_BIN_DIR}/mongoexport
	ln -sf ${LOCAL_DIR}/bin/mongofiles	${LOCAL_BIN_DIR}/mongofiles
	ln -sf ${LOCAL_DIR}/bin/mongoimport	${LOCAL_BIN_DIR}/mongoimport
	ln -sf ${LOCAL_DIR}/bin/mongooplog	${LOCAL_BIN_DIR}/mongooplog
	ln -sf ${LOCAL_DIR}/bin/mongoperf	${LOCAL_BIN_DIR}/mongoperf
	ln -sf ${LOCAL_DIR}/bin/mongorestore	${LOCAL_BIN_DIR}/mongorestore
	ln -sf ${LOCAL_DIR}/bin/mongos		${LOCAL_BIN_DIR}/mongos
	ln -sf ${LOCAL_DIR}/bin/mongostat	${LOCAL_BIN_DIR}/mongostat
	ln -sf ${LOCAL_DIR}/bin/mongotop	${LOCAL_BIN_DIR}/mongotop
}
function _uninstall(){
  echo "_uninstall"
} 

function _start(){
	
	local readonly MONGO_DIR=$LOCAL_DIR/$DIR_NAME
	local readonly MONGOD_CMD=$MONGO_DIR/bin/mongod
	local readonly MONGO_CMD=$MONGO_DIR/bin/mongo

	mongod_ps=`pgrep  mongod  |wc -l`
	mongo_ps=`pgrep  mongo  |wc -l`

	if [[ "${mongod_ps}" -gt "0" ]]
	then
        	echo "mongod is running "
		exit 1 
	else
        	${MONGOD_CMD} --journal --fork  --logpath=/data/mongo_log --storageEngine=mmapv1
	fi

	#if [ "${mongo_ps}" -gt "0" ]
	#then
        #	echo "mongo is running"
	#	exit 1
	#else 
        #	${MONGO_CMD}

	#fi
}

function _stop(){
	 echo "_stop"
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

