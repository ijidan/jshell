#/bin/bash


function linkPHP(){
	ls -sf ${LOCAL_BIN_DIR}/pear 	/usr/local/${PHP_VERSION}/php/bin/pear
	ls -sf ${LOCAL_BIN_DIR}/pecl 	/usr/local/${PHP_VERSION}/php/bin/pecl
	ls -sf ${LOCAL_BIN_DIR}/phpize 	/usr/local/${PHP_VERSION}/php/bin/phpize
	ls -sf ${LOCAL_BIN_DIR}/php	/usr/local/${PHP_VERSION}/php/bin/php

	ls -sf ${LOCAL_BIN_DIR}/php-fpm /usr/local/${PHP_VERSION}/php/sbin/pear

}
function installComposer(){
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
}

function installPHP56(){
}

function getPHPExtDir(){
	pecl config-get "ext_dir"
}


