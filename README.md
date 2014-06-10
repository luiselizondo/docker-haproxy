ctlc-docker-haproxy
==================

Base docker image to run a HAProxy with Serf

Usage
-----

To create the image `luis/haproxy`, execute the following command on the ctlc-docker-haproxy folder:

	sudo docker build -t luis/haproxy .

Running the Serf agent
------------------------

	sudo docker run -d -p 80 luis/haproxy
