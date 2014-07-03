#!/bin/bash

if [ ! -d "/var/lib/rabbitmq/mnesia" ]; then

	if [ "$RABBITMQ_VHOST" ]; then
		/usr/sbin/rabbitmq-server &
		/usr/sbin/rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@${HOSTNAME}.pid
		rabbitmqctl add_vhost $RABBITMQ_VHOST
		rabbitmqctl stop /var/lib/rabbitmq/mnesia/rabbit\@${HOSTNAME}.pid
	fi

fi

/usr/sbin/rabbitmq-server

