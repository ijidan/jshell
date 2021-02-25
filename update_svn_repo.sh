#!/bin/bash

#版本号，如 /trunk 或者 /branches/ERP1.0Beta04Build0521
#VERSION_SVN_PATH="/trunk"
VERSION_SVN_PATH="/branches/presale_20160126"

SVN_HOST_PATH="svn://svn.oa.com/Web/"$VERSION_SVN_PATH

#发布脚本版本
PUBLISH_SCRIPT_VERSION=V20151209

#web server 用户账号
WEB_USER="user00"

#svn 账号密码
SVN_USER="Damon"
SVN_PASSWORD="1234567"

#文件映射配置
#依赖服务器环境目录配置，不理解的请不要动
PUBLISH_PATH[0]="/data/websites"
SVN_PATH[0]=$SVN_HOST_PATH"/erp"

PUBLISH_PATH[1]="/data/websites/api"
SVN_PATH[1]=$SVN_HOST_PATH"/api"

PUBLISH_PATH[2]="/data/php/library"
SVN_PATH[2]=$SVN_HOST_PATH"/common/php/library"

##数据库更新脚本
PUBLISH_PATH[3]="/data/db"
SVN_PATH[3]=$SVN_HOST_PATH"/common/db"

function publish_code()
{
	su $WEB_USER -c "svn sw --username $SVN_USER --password $SVN_PASSWORD --no-auth-cache $1 $2"
	#第一次使用此角本时先checkout
	su $WEB_USER -c "svn co --username $SVN_USER --password $SVN_PASSWORD --no-auth-cache $1 $2"
	su $WEB_USER -c "svn up --username $SVN_USER --password $SVN_PASSWORD --no-auth-cache $2"
	su $WEB_USER -c "svn revert --username $SVN_USER --password $SVN_PASSWORD --no-auth-cache -R $2"
	echo ""
}

echo ""
echo "Welcome to use publish script of $PUBLISH_SCRIPT_VERSION!"
echo "VERSION RELEASE START >>>>>>"

#check root
uid=$(id -u)
[ $uid -ne 0 ] && { echo "Only root to run this script."; exit 1; }

for i in "${!PUBLISH_PATH[@]}";
do
	echo "rebuild "${PUBLISH_PATH[$i]}" ..."
	publish_code ${SVN_PATH[$i]} ${PUBLISH_PATH[$i]}
done

echo "restart PHP-FPM..."

pkill -o php-fpm
/usr/local/php/sbin/php-fpm

echo ">>>>DONE"
echo ""
