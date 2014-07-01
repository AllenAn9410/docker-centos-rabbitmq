FROM centos
MAINTAINER Dan Burke <dburke@addictmud.org>
RUN yum update -y
RUN yum install -y wget
RUN yum install -y http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && yum clean all
RUN yum install -y erlang && yum clean all
RUN yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.4/rabbitmq-server-3.3.4-1.noarch.rpm && yum clean all
RUN yum clean all
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabbit,[{loopback_users,[]}]}]." > /etc/rabbitmq/rabbitmq.config
EXPOSE 5672 15672 25672 4369
CMD /usr/sbin/rabbitmq-server
