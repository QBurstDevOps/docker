FROM ubuntu:14.04

# Use latest jboss/base-jdk:7 image as the base
FROM jboss/base-jdk:7

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.1.0.Final

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/jboss/wildfly

# Expose the ports we're interested in
EXPOSE 8080 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface

# Define administrative credentials
RUN /opt/jboss/wildfly/bin/add-user.sh admin 123qwe --silent

# Add launcher and set executable permissions
ADD launch.sh /opt/launch.sh
RUN chmod +x /opt/launch.sh

# Launch Wildfly on boot
ENTRYPOINT /opt/launch.sh
