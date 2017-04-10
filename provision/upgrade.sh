#!/usr/bin/env bash

echo "[`date`] Start provision upgrade"

echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
apt-get -y update
apt-get -y upgrade

echo "[`date`] End   provision upgrade"
