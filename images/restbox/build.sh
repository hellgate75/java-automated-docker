#!/bin/bash
export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep restbox)"
if [[ -z "$EXISTS_IMAGE" ]]; then
    echo "Java Runner docker image missing ... creating a new one!!"
    CURRPWD="$PWD"
    cd ../../
    sudo chmod 777 ./gradlew
    sudo ./gradlew --build-file build.shell.gradle jar
    if [[ "0" == "$?" ]]; then
      sudo cp ./build/libs/rest-box.jar ./images/restbox/
      if [[ -e ./images/restbox/ ]]; then
        cd $CURRPWD
        sudo docker build --force-rm --no-cache -t builditftorelli/restbox:8 . 2>&1 > /dev/null 2>&1
        export EXISTS_IMAGE="$(docker images | grep builditftorelli | grep restbox)"
        if [[ -z "$EXISTS_IMAGE" ]]; then
          echo "Something went wrong ... image not created!!"
        else
          echo "Java Runner docker image created!!"
        fi
        echo "Removing Rest-Box binaries ..."
        sudo rm -Rf ./rest-box.jar

      else
        echo "Rest-Box build went wrong ...."
      fi
    else
      echo "Build of Rest-box went wrong ... (check you have java8 and gradle)"
    fi
else
   echo "Image builditftorelli/restbox:8 already exists ..."
fi
