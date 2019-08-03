#!/usr/bin/env bash

echo "[`date`] Start provision setup_mysql"

debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234qwer'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234qwer'
apt install -y mysql-server
apt install -y php7.0-mysql

cd /etc/mysql/mysql.conf.d
sed -i -e "s/^bind-address/#bind-address/" mysqld.cnf

/etc/init.d/mysql restart
service apache2 restart

echo "[`date`] End   provision setup_mysql"
