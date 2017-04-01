#!/usr/bin/env bash

echo "[`date`] Start provision setup_mysql"

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234qwer'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234qwer'
sudo apt-get install -y mysql-server

echo "[`date`] End   provision setup_mysql"
