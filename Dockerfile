FROM jenkins/jenkins:lts

# Make sure it matches as much as possible the version running on the host
ENV DOCKER_DEBIAN_PACKAGE 5:18.09.5~3-0~debian-stretch

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update  -qq \
    && apt-get install docker-ce=5:18.09.5~3-0~debian-stretch -y

RUN usermod -aG docker jenkins

RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ./bin/dockerGroup.sh /dockerGroup.sh
RUN chmod +x /dockerGroup.sh

USER jenkins

ENTRYPOINT /dockerGroup.sh && /sbin/tini -- /usr/local/bin/jenkins.sh