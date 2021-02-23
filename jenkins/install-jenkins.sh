#!/bin/sh
set -e

echo "Build Jenkins Docker Container"
JENKINS=`pwd`

echo 'JENKINS dir: ' $JENKINS

cd $JENKINS
sudo /usr/local/bin/docker-compose down
sudo /usr/local/bin/docker-compose build && /usr/local/bin/docker-compose up -d

sleep 10

sudo docker stop jenkins
sleep 5
sudo cp config.xml /var/jenkins_home
sudo cp -R ./jobs /var/jenkins_home/

sudo docker start jenkins
sleep 10
