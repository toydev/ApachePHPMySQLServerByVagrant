#!/usr/bin/env bash

echo "[`date`] Start provision setup_mysql"

debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234qwer'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234qwer'
apt-get install -y mysql-server
apt-get install -y php7.0-mysql

cd /etc/mysql/mysql.conf.d
sed -i -e "s/^bind-address/#bind-address/" mysqld.cnf

echo "[`date`] End   provision setup_mysql"
