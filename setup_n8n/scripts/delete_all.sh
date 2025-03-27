#!/bin/bash

docker stop $(docker ps -aq) && \
docker rm -f $(docker ps -aq) && \
docker volume rm -f $(docker volume ls -q) && \
docker network rm $(docker network ls --filter "name=bridge" -q | grep -v ^$) 2>/dev/null && \
docker network prune -f && \
docker image prune -a -f