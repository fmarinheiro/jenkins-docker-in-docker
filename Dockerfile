FROM jenkins/jenkins:lts

ARG DOCKER_PACKAGE_VERSION=5:18.09.5~3-0~debian-stretch

# Make sure it matches as much as possible the version running on the host
ENV DOCKER_DEBIAN_PACKAGE $DOCKER_PACKAGE_VERSION

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update  -qq \
    && apt-get install docker-ce=${DOCKER_DEBIAN_PACKAGE} -y

COPY ./bin/dockerGroup.sh /dockerGroup.sh
RUN chmod +x /dockerGroup.sh


ENTRYPOINT /dockerGroup.sh && su -c "/sbin/tini -- /usr/local/bin/jenkins.sh" jenkins
