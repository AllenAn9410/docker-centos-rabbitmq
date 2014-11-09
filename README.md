If you're only running one RabbitMQ instance / container from this host:

# docker run -d -p 5672:5672 -p 15672:15672 dwburke/centos-rabbitmq-3.4.1

If you're going to run more than one:

# docker run -d -P dwburke/centos-rabbitmq-3.4.1


Environment variables:

- RABBITMQ_USER
- RABBITMQ_PASS - required if RABBITMQ_USER is passed
- RABBITMQ_VHOST


If RABBITMQ_USER is defined, the initial startup will remove the GUEST user
and give this specificed user full access to RABBITMQ_VHOST (if defined)
and the "/" vhost.

RABBITMQ_USER also gets the "administrator" tag.

