#!/bin/bash
export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep javarunner)"
if [[ -z "$EXISTS_IMAGE" ]]; then
    echo "Java Runner docker image missing ... creating a new one!!"
    docker build --force-rm --no-cache -t builditftorelli/javarunner:8 . 2>&1 > /dev/null 2>&1
    export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep javarunner)"
    if [[ -z "$EXISTS_IMAGE" ]]; then
      echo "Something went wrong ... image not created!!"
    else
      echo "Java Runner docker image created!!"
    fi
else
   echo "Image builditftorelli/javarunner:8 already exists ..."
fi
