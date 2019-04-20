#! /bin/bash

DOCKER_GROUP=docker
JENKINS_USER=jenkins
DOCKER_SOCK_GROUP=$(ls -l /var/run/docker.sock  | awk '{print $4}')

sudo groupdel $DOCKER_GROUP
sudo groupadd -g $DOCKER_SOCK_GROUP $DOCKER_GROUP
sudo usermod -aG $DOCKER_GROUP $JENKINS_USER
sudo passwd -d jenkins