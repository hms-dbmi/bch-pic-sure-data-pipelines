#!/usr/bin/env bash

CWD=`pwd`

echo "Starting update"
yum -y update 

echo "Finished update, adding epel, docker-ce  repositories and installing wget and yum-utils"
yum -y install epel-release wget yum-utils
yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y update

echo "Added docker-ce repo, starting docker install"
yum -y install docker-ce docker-ce-cli containerd.io

echo "Finished docker install, enabling and starting docker service"
systemctl enable docker
service docker start

#yum -y update
#yum install -y python3
#curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#mount /tmp -o remount,exec
#docker-compose --version

#../jenkins/install-jenkins.sh

echo "Installation script complete."
