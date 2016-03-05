FROM dwburke/centos-erlang
MAINTAINER Dan Burke <dburke@addictmud.org>
RUN yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.1/rabbitmq-server-3.6.1-1.noarch.rpm && yum clean all
RUN echo "[{rabbit,[{loopback_users,[]}]}]." > /etc/rabbitmq/rabbitmq.config
EXPOSE 5672 15672 25672 4369
RUN rm -f /.erlang.cookie
RUN rm -rf /var/lib/rabbitmq/mnesia
ADD start_server.sh /
CMD /start_server.sh
