#!/bin/sh

apt-get install apache2 -y
cd /etc/apache2/sites-available
sudo cp 000-default.conf 001-www.conf
sudo sed -i -e "s/webmaster@localhost/toy@ownway.info/" 001-www.conf
sudo sed -i -e "s/\/var\/www\/html/\/vagrant_data\/site/" 001-www.conf
sudo cat /vagrant_data/provision/001-www.conf >> 001-www.conf
sudo a2dissite 000-default
sudo a2ensite 001-www
sudo apache2ctl restart
