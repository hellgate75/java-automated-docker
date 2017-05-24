#!/bin/bash
export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep serverjre)"
if [[ -z "$EXISTS_IMAGE" ]]; then
    echo "Java docker image missing ... creating a new one!!"
    if ! [[ -e ./server-jre-8u121-linux-x64.tar.gz ]]; then
        wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/server-jre-8u121-linux-x64.tar.gz -O ./server-jre-8u121-linux-x64.tar.gz
    fi
    docker build --force-rm --no-cache -t builditftorelli/serverjre:8 . > /dev/null 2>&1
    export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep serverjre)"
    if [[ -z "$EXISTS_IMAGE" ]]; then
      echo "Something went wrong ... image not created!!"
    else
      echo "Java docker image created!!"
    fi
    echo "Removing java8 binaries ..."
    rm -Rf ./server-jre-8u121-linux-x64.tar.gz
else
   echo "Image oracle/serverjre:8 already exists ..."
fi
#Cleani
