# Pull base image.
FROM dockerfile/python

# Install Node.js from binary

RUN \
  cd /opt && \
  wget http://project-rt.s3-website-us-east-1.amazonaws.com/softwares/node-v0.10.29-linux-x64.tar.gz && \
  tar -xzf node-v0.10.29-linux-x64.tar.gz && \
  mv node-v0.10.29-linux-x64 node && \
  cd /usr/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.10.29-linux-x64.tar.gz
  
# Bundle app source
COPY . /src
# Install app dependencies
RUN cd /src; npm install

EXPOSE  8080
CMD ["node", "/src/index.js"]

