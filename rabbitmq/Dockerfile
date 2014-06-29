FROM centos
MAINTAINER Dan Burke <dburke@addictmud.org>
RUN yum update -y
RUN yum install -y wget
ADD http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm /
ADD http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.4/rabbitmq-server-3.3.4-1.noarch.rpm /
RUN yum install -y /erlang-solutions-1.0-1.noarch.rpm
RUN yum install -y erlang
RUN yum install -y /rabbitmq-server-3.3.4-1.noarch.rpm
RUN yum clean all
RUN rm -f /erlang-solutions-1.0-1.noarch.rpm /rabbitmq-server-3.3.4-1.noarch.rpm
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabbit,[{loopback_users,[]},{vm_memory_high_watermark, 0.9}]}]." > /etc/rabbitmq/rabbitmq.config
EXPOSE 5672 15672 4369
CMD /usr/sbin/rabbitmq-server
