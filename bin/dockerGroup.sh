#! /bin/bash

DOCKER_GROUP=docker
JENKINS_USER=jenkins
DOCKER_SOCK_GROUP=$(ls -l /var/run/docker.sock  | awk '{print $4}')

if grep -q $DOCKER_SOCK_GROUP /etc/group
then
   sudo usermod -aG $DOCKER_SOCK_GROUP $JENKINS_USER
else
   sudo groupdel $DOCKER_GROUP
   sudo groupadd -g $DOCKER_SOCK_GROUP $DOCKER_GROUP
fi

sudo usermod -aG $DOCKER_GROUP $JENKINS_USER
sudo passwd -d jenkins