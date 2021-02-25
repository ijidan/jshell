#!/bin/bash

function installMemcached(){

	readonly SRC_PATH=/usr/local/src
	readonly FILE_NAME=memcached-2.2.0.tgz
	readonly DIR_NAME=memcached-2.2.0
	readonly PHP_DIR=/usr/local/php
	readonly MEMCACHED_DIR=/usr/local/libmemcached-1.0.18

	if grep "extension=\"memcached.so\""  $PHP_DIR/etc/php.ini
	then
        	echo "memcached extension has been installed!"
        	exit  1  
	fi
	cd $SRC_PATH
	if [ !-f $FILE_NAME];then
        	wget http://pecl.php.net/get/$FILE_NAME
	fi
	if [ !-d $DIR_NAME ]
	then
        	tar -zxvf $FILE_NAME
	fi
	cd $DIR_NAME
	$PHP_DIR/bin/phpize
	./configure --with-php-config=$PHP_DIR/bin/php-config --enable-memcached --with-libmemcached-dir=$MEMCACHED_DIR --disable-memcached-sasl
	make && make install 
}

function installMongodb(){

	readonly PHP_DIR=/usr/local/php

	if grep "extension=\"mongodb.so\""  $PHP_DIR/etc/php.ini
	then
        	echo "memcached extension has been installed!"
        	exit    
	fi
	pecl install mongodb 
	echo add "extension=\"mongodb.so\"" to php.ini file

}

function installMemcache(){
	
	cd /usr/local/src
	wget wget http://pecl.php.net/get/memcache-2.2.6.tgz
	tar -zxvf memcache-2.2.6.tgz
	cd memcache-2.2.6
	/usr/local/php/bin/phpize 
	./configure --with-php-config=/usr/local/php/bin/php-config --enable-memcache
	make make install 

}
