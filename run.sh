#!/bin/bash

docker run -d \
	-p 5672:5672 \
	-p 15672:15672 \
	--name=rmq1 \
	-e RABBITMQ_VHOST=appname-dev \
	-e RABBITMQ_USER=appuser \
	-e RABBITMQ_PASS=abc123 \
	dwburke/centos-rabbitmq


