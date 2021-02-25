#!/bin/bash

source ./common.sh

function installGearman(){
	echoTip "cd ${SRC_DIR}"
	cd ${SRC_DIR}
	local readonly gearman_file=${GEARMAN_VERSION}.tar.gz
	checkExistAndDel ${gearman_file}

	echoTip "downloading ${gearman_file}"
	wget https://launchpad.net/gearmand/1.2/1.1.12/+download/${gearman_file}
	wget "https://launchpad.net/gearmand/1.2/1.1.12/+download/{$gearman_file}"
	checkExistAndDel ${GEARMAN_VERSION}

	echoTip "decompress ${gearman_file}"
	tar -zxvf ${gearman_file}

	echoTip "cd ${SRC_DIR}/${GEARMAN_VERSION} "
	cd ${SRC_DIR}/${GEARMAN_VERSION}

	echoTip "configure...."
	./configure --prefix=${LOCAL_DIR}/${GEARMAN_VERSION}
	
	echoTip "making "
	make && make install
}


installGearman
