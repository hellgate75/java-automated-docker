#!/bin/sh
docker build --force-rm --no-cache -t wipro/restbox:8 . > /dev/null 2>&1
