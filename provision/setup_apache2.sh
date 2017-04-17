#!/usr/bin/env bash

echo "[`date`] Start provision setup_apache2"

apt-get install -y apache2

# Mod
a2enmod rewrite

# Site
cd /etc/apache2/sites-available
cp 000-default.conf 001-www.conf
sed -i -e "s/webmaster@localhost/toy@ownway.info/" 001-www.conf
sed -i -e "s/\/var\/www\/html/\/vagrant_data\/site/" 001-www.conf
cat /vagrant/provision/support/001-www.conf >> 001-www.conf
a2dissite 000-default
a2ensite 001-www

apache2ctl restart

echo "[`date`] End   provision setup_apache2"
