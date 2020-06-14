#!/bin/bash
# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl


while [ ! -f /tmp/admin.finish ]
do
  sleep 5

done


 # remove tar files from directory
 rm -rf /home/ubuntu/nexledger/*.tar
 # remove license file
 #rm -rf /home/ubuntu/nexledger/activationKey_offline.dat
 #rm -rf /home/ubuntu/nexledger/ldkserver.crt


# remove password and restart sshd
sudo sed -i -e "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo service sshd restart
# passwd -d ubuntu

echo "Finished installation for Nexledger v2.2 ! ...."
touch /tmp/wait.finish
