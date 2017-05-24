# LICENSE MIT
#
# Copyright (c) 2017 Wipro Ltd and/or its affiliates. All rights reserved.
#
FROM builditftorelli/serverjre:8

MAINTAINER Fabrizio Torelli <fabrizio.torelli@wipro.com>

ENV JAVA_OPTS="-XX:MaxPermSize=20M" \
    JAR_PATH="/root/app/sample.jar" \
    APP_PATH="/root/app" \
    APP_LOGS="/root/app/app-out.log" \
    PATH=/root/bin:$PATH \
    APP_ARGS="" \
    JAVA_HOME=/usr/java/default

RUN mkdir -p /root/app
RUN mkdir -p /root/bin

ADD start-java-process /root/bin/start-java-process
RUN chmod 777 /root/bin/start-java-process

VOLUME ["/root/app"]

WORKDIR /root/app

ENTRYPOINT ["/bin/bash", "-c", "start-java-process"]

EXPOSE 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091 8092 8093 8094 8095 8096 8097 8098 8099 8100
