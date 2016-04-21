#!/bin/bash

docker build -t=dwburke/centos-rabbitmq:342 .
#docker tag `docker images | grep dwburke/centos-rabbitmq-3.3.4 | grep latest | awk '{ print $3 }'` jamasia:5000/rabbitmq-3.3.4 

