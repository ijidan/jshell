#!/usr/bin/bash

systemctl $1  nginx
systemctl $1  php-fpm
systemctl $1  mysql
systemctl $1  redis
systemctl $1  memcached
