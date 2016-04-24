FROM debian:jessie
MAINTAINER Roman Finkelnburg

ENV DEBIAN_FRONTEND noninteractive

# Add docker repository
COPY apt/dockerproject.list /etc/apt/sources.list.d/dockerproject.list
COPY apt/dockerproject.gpg /root/dockerproject.gpg
RUN apt-key add /root/dockerproject.gpg

# debian
RUN apt-get update && \
  apt-get install -y docker-engine sudo python-pip && \
  apt-get autoremove && \
  apt-get clean && \
  rm -rf /var/apt/lists/* /var/tmp/* /tmp/*

RUN pip install docker-compose

VOLUME /var/lib/docker
