FROM ubuntu:12.04

MAINTAINER QBurst

RUN apt-get update; apt-get install -y unzip wget supervisor openssh-server curl sudo
RUN curl -sSL https://get.docker.io/ubuntu/ | sudo sh
RUN echo DOCKER_OPTS="-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock" > /etc/default/docker
ENV DOCKER_HOST tcp://localhost:4243
RUN wget  -q -O - http://project-rt.s3-website-us-east-1.amazonaws.com/softwares/jdk-7u67-linux-x64.tar.gz | tar -xzf - -C /opt
ENV JAVA_HOME /opt/jdk1.7.0_67 
RUN ln -s /opt/jdk1.7.0_67/bin/* /usr/bin/
RUN echo 'root:kryptonite' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
