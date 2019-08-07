#!/usr/bin/env bash

echo "[`date`] Start provision `basename $0`"

debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234qwer'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234qwer'
apt install -y mysql-server
apt install -y php-mysql

cd /etc/mysql/mysql.conf.d
sed -i -e "s/^bind-address/#bind-address/" mysqld.cnf

service mysql restart
service apache2 restart

echo "[`date`] End   provision `basename $0`"
