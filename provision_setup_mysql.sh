#!/bin/sh

debconf-set-selections <<< 'mysql-server mysql-server/root_password password 1234qwer'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 1234qwer'
apt-get install -y mysql-server
