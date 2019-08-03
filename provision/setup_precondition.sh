#!/usr/bin/env bash

echo "[`date`] Start provision `basename $0`"

apt -y update

sudo curl -o /usr/local/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && sudo chmod +x /usr/local/bin/jq

echo "[`date`] End   provision `basename $0`"
