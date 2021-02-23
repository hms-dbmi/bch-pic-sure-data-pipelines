#!/usr/bin/env bash

CWD=`pwd`

echo "Starting update"
sudo yum -y update 

echo "Finished update, adding epel, docker-ce  repositories and installing wget and yum-utils"
sudo yum -y install epel-release wget yum-utils
sudo yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y update

echo "Added docker-ce repo, starting docker install"
sudo yum -y install docker-ce docker-ce-cli containerd.io

echo "Finished docker install, enabling and starting docker service"
sudo systemctl enable docker
sudo service docker start

sudo yum -y update
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo mount /tmp -o remount,exec
sudo /usr/local/bin/docker-compose --version

sudo chmod a+x ../jenkins/install-jenkins.sh
cd ../jenkins
sudo sh ./install-jenkins.sh
cd ../initial-configuration

echo "Installation script complete."
