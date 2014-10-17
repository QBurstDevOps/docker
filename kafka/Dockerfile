FROM qburstdevops/base

MAINTAINER QBurst 

RUN wget -q -O - http://project-rt.s3-website-us-east-1.amazonaws.com/softwares/kafka_2.8.0-0.8.1.1.tgz | tar -xzf - -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_2.8.0-0.8.1.1
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh 

