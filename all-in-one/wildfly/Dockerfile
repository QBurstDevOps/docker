FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install Oracle JDK 7
RUN apt-get -y install python-software-properties wget maven curl vim git
RUN apt-get clean
RUN wget -q -O - http://project-rt.s3-website-us-east-1.amazonaws.com/softwares/jdk-7u67-linux-x64.tar.gz | tar -xzf - -C /opt
ENV JAVA_HOME /opt/jdk1.7.0_67
RUN echo 'PATH=$PATH:$JAVA_HOME/bin' >> /etc/bash.bashrc

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.1.0.Final

# Create the wildfly user and group
#RUN groupadd -r wildfly -g 433 && useradd -u 431 -r -g wildfly -d /opt/wildfly -s /sbin/nologin -c "WildFly user" wildfly

# Create directory to extract tar file to
RUN mkdir /opt/wildfly-$WILDFLY_VERSION

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
RUN cd /opt && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx 

# Make sure the distribution is available from a well-known place
RUN ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly 

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/wildfly

# Expose the ports we're interested in
EXPOSE 8080 9990 8009

# Run everything below as the wildfly user
USER wildfly

# Define administrative credentials
RUN /wildfly/bin/add-user.sh admin 123qwe --silent

# Add launcher and set executable permissions
ADD launch.sh /opt/launch.sh
RUN chmod +x /opt/launch.sh

# Launch Wildfly on boot
ENTRYPOINT /opt/launch.sh