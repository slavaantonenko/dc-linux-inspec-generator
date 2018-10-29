#!/bin/bash
echo "Creating hardlink for /opt/chef in $(pwd)/chef"
mkdir chef
mount --bind /opt/chef chef
echo "Copying /usr/local/bin/berks"
cp /usr/local/bin/berks berks
