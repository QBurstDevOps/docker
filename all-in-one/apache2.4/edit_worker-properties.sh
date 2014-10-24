#!/bin/bash
IP=`echo $WF_PORT_8009_TCP_ADDR`
sed -i "s/worker.ajp13_worker.host=localhost/worker.ajp13_worker.host=$IP/g" /etc/libapache2-mod-jk/workers.properties

