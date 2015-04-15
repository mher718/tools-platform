#!/bin/sh
#===============================================================================
#
#          FILE:  db_init.sh
#         USAGE:  db_init.sh
#   DESCRIPTION:  check the current version of zabbix database and install if required
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  if env MYSQL_ROOT_PASSWORD is defined - database will be created
#        AUTHOR:  Aleksandr Bezpalko (a.bezpalko@external.oberthur.com)
#       COMPANY:  Oberthur
#       VERSION:  1.1
#       CREATED:  06.04.15 08:47:29 EDT
#      REVISION:  ---
#===============================================================================

FLAG=/zabbix_db_installed

if [ -e $FLAG ] ; then
	exit
fi

CONFIG=/etc/zabbix/zabbix_server.conf
if [ -r $CONFIG ] ; then
	eval `grep ^DB $CONFIG`
else
	echo "zabbix config not found ($CONFIG)"
	exit
fi

if [ -z "$DBHost" -o -z "$DBUser" -o -z "$DBPassword" -o -z "$DBName" ] ; then
	echo "database is not defined correctly in $CONFIG"
	echo "DBHost, DBUser, DBPassword and DBName shall be defined"
	exit
fi


if [ $MYSQL_ROOT_PASSWORD ] ; then
	echo "Try to create database and grant permissions"
	/usr/bin/mysql -h $DBHost -uroot -p$MYSQL_ROOT_PASSWORD \
		--execute="create database $DBName character set utf8 collate utf8_bin;"
	/usr/bin/mysql -h $DBHost -uroot -p$MYSQL_ROOT_PASSWORD \
		--execute="grant all privileges on $DBName.* to $DBUser@% identified by '$DBPassword';"
fi

MYSQL="/usr/bin/mysql -h $DBHost -u$DBUser -p$DBPassword"
VERSION=`$MYSQL -NB -e'select mandatory from dbversion' $DBName 2>/dev/null`

if [ -z $VERSION ] ; then
	echo installing database
	for src in schema images data ; do
			echo insert $src
			/bin/zcat /usr/share/zabbix-server-mysql/$src.sql.gz | $MYSQL --sigint-ignore --force $DBName
	done
fi
$MYSQL -NB -e'select mandatory from dbversion' $DBName 2>/dev/null >$FLAG
