FROM test/base
MAINTAINER Roman Finkelnburg

ENV DEBIAN_FRONTEND noninteractive

# Install additional PHP stuff...
RUN apt-get update && apt-get install -y php5 php5-curl php5-xdebug php5-apcu && \
  apt-get autoremove && \
  apt-get clean && \
  rm -rf /var/apt/lists/* /var/tmp/* /tmp/*

# Install startup script...
COPY php_v1.run.sh /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]
