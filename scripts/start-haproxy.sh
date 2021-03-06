#!/bin/bash
if [ -z "$HAPROXY_USERNAME" ]; then
    export HAPROXY_USERNAME="admin"
fi  

if [ -z "$HAPROXY_URI" ]; then
    export HAPROXY_URI="/haproxy?stats"
fi  

if [ -n "$HAPROXY_PASSWORD" ]
then
  echo "	stats enable" >> /etc/haproxy/haproxy.cfg
  echo "	stats auth $HAPROXY_USERNAME:$HAPROXY_PASSWORD" >> /etc/haproxy/haproxy.cfg
  echo "	stats uri $HAPROXY_URI" >> /etc/haproxy/haproxy.cfg
fi

echo "Access haproxy stats at $HAPROXY_URI"
echo "Username: $HAPROXY_USERNAME"
echo "Password: $HAPROXY_PASSWORD"

exec service haproxy start