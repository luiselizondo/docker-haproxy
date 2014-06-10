FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

# Let's get haproxy
RUN apt-get update -q
RUN apt-get install -y haproxy

RUN apt-get install -qy supervisor

ADD ./config/enabled /etc/default/haproxy
ADD ./config/haproxy.cfg /etc/haproxy/haproxy.cfg
ADD ./config/supervisord-haproxy.conf /etc/supervisor/conf.d/supervisord-haproxy.conf

ADD ./scripts/start-haproxy.sh /start-haproxy.sh
RUN chmod 755 /*.sh

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n"]