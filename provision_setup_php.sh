#!/usr/bin/env bash

echo "[`date`] Start provision setup_php"

apt-get install -y php7.0
apt-get install -y php7.0-mbstring
apt-get install -y php7.0-sqlite3
apt-get install -y php-pear
apt-get install -y libapache2-mod-php7.0

echo "[`date`] End   provision setup_php"
