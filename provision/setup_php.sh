#!/usr/bin/env bash

echo "[`date`] Start provision `basename $0`"

apt install -y php
apt install -y php-mbstring
apt install -y php-sqlite3
apt install -y php-pear
apt install -y libapache2-mod-php

apt install -y php-dev
pecl channel-update pecl.php.net
pecl install xdebug
cp /vagrant/provision/support/xdebug.ini /etc/php/7.2/mods-available
ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/apache2/conf.d/20-xdebug.ini

echo "[`date`] End   provision `basename $0`"
