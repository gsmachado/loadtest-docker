FROM ubuntu:xenial

MAINTAINER gsm at machados dot org
USER root

RUN apt-get -qqy update && \
	apt-get -qqy install nodejs npm locales wget netcat curl apt-transport-https apt-utils && \
	ln -s /usr/bin/nodejs /usr/bin/node

# fixing locales issues
RUN locale-gen "en_US.UTF-8" && \
	dpkg-reconfigure locales

RUN npm install -g loadtest
