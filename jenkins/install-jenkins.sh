#!/bin/sh
set -e

echo "Build Jenkins Docker Container"
JENKINS=`pwd`

echo 'JENKINS dir: ' $JENKINS

cd $JENKINS
/usr/local/bin/docker-compose down
/usr/local/bin/docker-compose build && /usr/local/bin/docker-compose up -d

sleep 10

docker stop jenkins
sleep 5
cp config.xml /var/jenkins_home
cp -R ./jobs /var/jenkins_home/

docker start jenkins
sleep 10
