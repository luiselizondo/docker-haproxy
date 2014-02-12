FROM ubuntu:quantal
MAINTAINER Lucas Carlson <lucas@rufy.com>

# Let's get haproxy
RUN apt-get update -q
RUN apt-get install -y haproxy

# Let's get serf
RUN apt-get install -qy supervisor unzip
ADD https://dl.bintray.com/mitchellh/serf/0.4.1_linux_amd64.zip serf.zip
RUN unzip serf.zip
RUN mv serf /usr/bin/

ADD haproxy.conf /etc/haproxy/haproxy.conf
ADD serf-event-handler.sh /serf-event-handler.sh

ADD /start-haproxy.sh /start-haproxy.sh
ADD /start-serf.sh /start-serf.sh
ADD /serf-join.sh /serf-join.sh
ADD /run.sh /run.sh
ADD /supervisord-haproxy.conf /etc/supervisor/conf.d/supervisord-haproxy.conf
ADD /supervisord-serf.conf /etc/supervisor/conf.d/supervisord-serf.conf
RUN chmod 755 /*.sh

EXPOSE 80
CMD ["/run.sh"]