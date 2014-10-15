#
# Node.js Dockerfile
#
# https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM dockerfile/python

# Install Node.js

RUN \
  cd /opt && \
  wget http://project-rt.s3-website-us-east-1.amazonaws.com/softwares/node-v0.10.29-linux-x64.tar.gz && \
  tar -xzf node-v0.10.29-linux-x64.tar.gz && \
  mv node-v0.10.29-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.10.29-linux-x64.tar.gz

# Define default command.
CMD ["bash"]
RUN mkdir /var/www

# Define working directory.
WORKDIR /data

ADD app.js /var/www/app.js

CMD ["/usr/bin/node", "/var/www/app.js"] 
