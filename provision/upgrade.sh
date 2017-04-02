#!/usr/bin/env bash

echo "[`date`] Start provision upgrade"

apt-get -y update
apt-get -y upgrade

echo "[`date`] End   provision upgrade"
