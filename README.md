If you're only running one RabbitMQ instance / container from this host:

# docker run -d -p 5672:5672 -p 15672:15672 dwburke/centos-rabbitmq-3.3.4

If you're going to run more than one:

# docker run -d -P dwburke/centos-rabbitmq-3.3.4

