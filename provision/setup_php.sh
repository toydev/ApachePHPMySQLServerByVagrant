#!/usr/bin/env bash

echo "[`date`] Start provision setup_php"

apt-get install -y php7.0
apt-get install -y php7.0-mbstring
apt-get install -y php7.0-sqlite3
apt-get install -y php-pear
apt-get install -y libapache2-mod-php7.0

apt-get install -y php7.0-dev
pecl install xdebug
cd /etc/php/7.0/apache2/conf.d
cp /vagrant/provision/support/xdebug.ini /etc/php/7.0/mods-available
ln -s ../../mods-available/xdebug.ini 20-xdebug.ini

echo "[`date`] End   provision setup_php"
