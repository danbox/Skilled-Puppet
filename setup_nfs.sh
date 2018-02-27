#!/bin/bash

sudo yum --enablerepo=base,updates --assumeyes install nfs-utils

sudo systemctl enable nfs-server.service
sudo systemctl start nfs-server.service

sudo firewall-cmd --permanent --zone=public --add-service=nfs
sudo firewall-cmd --permanent --zone=public --add-service=mountd
sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind
sudo firewall-cmd --reload

sudo userdel -r vagrant
sudo usermod -u 1000 danbox
sudo groupmod -g 1000 danbox
find / -user 1001 -exec chown -h 1000 \;
find / -group 1002 -exec chgrp -h 1000 \;
usermod -g 1000 danbox
