#!/bin/bash

source ./common.sh

function installSVN(){
	echoTip "cd ${SRC_DIR}"
	cd ${SRC_DIR}
	local readonly svn_file=${SVN_VERSION}.tar.gz
	checkExistAndDel ${svn_file}

	echoTip "downloading ${svn_file}"
	wget http://mirrors.hust.edu.cn/apache/subversion/${svn_file}
	checkExistAndDel ${SVN_VERSION}

	echoTip "decompress ${svn_file}"
	tar -zxvf ${svn_file}

	echoTip "cd ${SRC_DIR}/${SVN_VERSION} "
	cd ${SRC_DIR}/${SVN_VERSION}

	echoTip "configure...."
	./configure --prefix=${LOCAL_DIR}/${SVN_VERSION}
	
	echoTip "making "
	make && make install
}


installSVN
