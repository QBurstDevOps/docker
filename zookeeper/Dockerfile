FROM qburstdevops/base

MAINTAINER QBurst

RUN wget -q -O - http://archive-primary.cloudera.com/cdh5/ubuntu/precise/amd64/cdh/pool/contrib/z/zookeeper/zookeeper_3.4.5+cdh5.1.2+31.orig.tar.gz | tar -xzf - -C /opt
RUN mv /opt/zookeeper-3.4.5-cdh5.1.2/conf/zoo_sample.cfg /opt/zookeeper-3.4.5-cdh5.1.2/conf/zoo.cfg

ENV ZK_HOME /opt/zookeeper-3.4.5-cdh5.1.2
RUN sed -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh
EXPOSE 2181 2888 3888
WORKDIR /opt/zookeeper-3.4.5-cdh5.1.2
VOLUME ["/opt/zookeeper-3.4.5-cdh5.1.2/conf", "/opt/zookeeper-3.4.5-cdh5.1.2/data"]
CMD /usr/sbin/sshd && start-zk.sh
