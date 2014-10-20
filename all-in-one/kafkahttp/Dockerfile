FROM qburstdevops/base

MAINTAINER QBurst

ENV KAFKA_HTTP_HOME /opt/kafka-http

RUN git clone https://github.com/mailgun/kafka-http

RUN cp -R kafka-http /opt/kafka-http

ADD . /home

RUN \
  ln -s /home/start-kafka-http /bin/

RUN \
  cd /opt/kafka-http;./sbt release 

EXPOSE 8080 8090

CMD ["/bin/start-kafka-http"]

