#!/bin/bash

source ./common.sh

case $1 in 
	"install")
        
	;;
	"uninstall")
	;;
	"start")
	;;
	"restart")
	;;
	"stop")
	;;
	"reset")
	;;
	"backup")
	;;
	*)
	 	echo "option:"
	 	echo "install		install mysql"
 	 	echo "uninstall        uninstall mysql"
	 	echo "start            start mysql"
	 	echo "restart          restart mysql"
	 	echo "stop		stop mysql"
	 	echo "reset		reset mysql's root password"
	 	echo "backup		backup mysql data"
	;;
esac

function install(){

}
