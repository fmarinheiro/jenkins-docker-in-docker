# Docker-in-Docker Jenkins

Jenkins docker image with docker ce installed, fixes jenkins user docker.sock access, based on jenkins/jenkins:lts official image.

### Usage 

```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock fmarinheiro/jenkins-docker-in-docker:latest

```

Make sure the docker version installed inside the container matches as much as possible the on your host. For the you can rebuild the image locally setting the `DOCKER_DEBIAN_PACKAGE` environment variable.
Runing `apt-cache madison docker-ce` inside the container will give you a list of the available package versions.

Enjoy!!