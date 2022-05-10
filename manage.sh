#!/bin/bash

WORK_PATH='/root/webTeam/manage/'
cd $WORK_PATH
git reset --hard origin/master
git clean -f
git pull origin master
docker build -t manage-images .
docker stop manage-container
docker rm manage-container
docker run -itd -p 9001:9001 --name manage-container  manage-images

