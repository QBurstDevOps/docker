# An example Ubuntu container for a web application
FROM ubuntu:utopic
MAINTAINER QBurst 

RUN apt-get update && apt-get install -y apache2 supervisor libapache2-mod-jk
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/supervisor
RUN a2enmod ssl
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY jk.conf          /etc/apache2/mods-available/jk.conf
COPY 000-default.conf      /etc/apache2/sites-available/000-default.conf
COPY edit_worker-properties.sh /tmp/edit_worker-properties.sh
EXPOSE 80
CMD ["/usr/bin/supervisord"]
