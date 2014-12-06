#!/bin/bash

if [ ! -d "/var/lib/rabbitmq/mnesia" ]; then

	/usr/sbin/rabbitmq-server &
	sleep 3
	/usr/sbin/rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@${HOSTNAME}.pid

	if [ "$RABBITMQ_USER" ]; then
		if [ ! "$RABBITMQ_PASS" ]; then
			echo "RABBITMQ_PASS required with RABBITMQ_USER"
			exit 1
		fi
		rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASS
		rabbitmqctl set_user_tags $RABBITMQ_USER administrator
		rabbitmqctl delete_user guest
	fi

	if [ "$RABBITMQ_VHOST" ]; then
		rabbitmqctl add_vhost $RABBITMQ_VHOST

		if [ "$RABBITMQ_USER" ]; then
			rabbitmqctl set_permissions $RABBITMQ_USER ".*" ".*" ".*"
			rabbitmqctl set_permissions -p $RABBITMQ_VHOST $RABBITMQ_USER ".*" ".*" ".*"
		fi

	fi

	rabbitmqctl stop /var/lib/rabbitmq/mnesia/rabbit\@${HOSTNAME}.pid

fi

/usr/sbin/rabbitmq-server

