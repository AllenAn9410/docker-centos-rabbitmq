FROM dwburke/centos-erlang
MAINTAINER Dan Burke <dburke@addictmud.org>
RUN yum update -y && yum clean all
RUN yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.4.2/rabbitmq-server-3.4.2-1.noarch.rpm && yum clean all
RUN /usr/sbin/rabbitmq-plugins --offline enable rabbitmq_management
RUN echo "[{rabbit,[{loopback_users,[]}]}]." > /etc/rabbitmq/rabbitmq.config
EXPOSE 5672 15672 25672 4369
RUN rm -f /.erlang.cookie
ADD start_server.sh /
CMD /start_server.sh
