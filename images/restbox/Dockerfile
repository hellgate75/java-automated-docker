# LICENSE MIT
#
# Copyright (c) 2017 Wipro Ltd and/or its affiliates. All rights reserved.
#
FROM builditftorelli/serverjre:8

MAINTAINER Fabrizio Torelli <fabrizio.torelli@wipro.com>

ENV JAVA_OPTS="" \
    JAR_PATH="/root/bin/rest-box.jar" \
    PATH=/root/bin:$PATH \
    JAVA_HOME=/usr/java/default

RUN mkdir -p /root/bin

ADD ./call-rest /root/bin/call-rest
RUN chmod 777 /root/bin/call-rest

ADD ./rest-box.jar /root/bin/rest-box.jar
RUN chmod 777 /root/bin/rest-box.jar

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
