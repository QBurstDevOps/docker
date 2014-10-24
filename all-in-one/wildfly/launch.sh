#!/bin/bash
IPADDR=0.0.0.0
/opt/jboss/wildfly/bin/standalone.sh -c standalone-ha.xml -Djboss.bind.address=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.node.name=server-$IPADDR
