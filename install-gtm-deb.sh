#!/usr/bin/env bash

echo 'Preparing environment'

sudo apt-get update
#sudo apt-get install -y --no-install-recommends build-essential libelf-dev 
#sudo apt-get install -y --no-install-recommends gzip openssh-server curl

echo 'Installing GT.M'
sudo apt-get install -y --no-install-recommends man-db openssh-server fis-gtm

actual_package=`apt-cache depends fis-gtm|grep Depends: | cut -f2,2 -d:`
gtm_profile=`dpkg -L ${actual_package} | grep utf8/gtmprofile$`
cat <<EOF > ~/.profile
source ${gtm_profile}
EOF

echo 'Cleaning up temporary files'
rm -rf /tmp/tmp
rm -rf /var/lib/apt/lists/*

echo 'Done!'
