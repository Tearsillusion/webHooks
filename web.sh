#!/bin/bash


WORK_PATH='/root/webTeam/web/'
cd $WORK_PATH
git reset --hard origin/master
git clean -f
git pull origin master
docker stop web-container
docker rm web-container
make build-image
docker run -itd -p 9002:80 --name web-container  web-team:latest



