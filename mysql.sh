#!/bin/bash
#docker run -itd --name mysql-container -p 9004:3306 -e MYSQL_ROOT_PASSWORD=ljl1234 mysql-images

WORK_PATH='/root/webTeam/manage/'
cd $WORK_PATH
docker stop mysql-container
docker rm mysql-container
docker build -t mysql-images ./docker
docker run -itd  --name mysql-container -p 9004:3306 \
-v /root/webTeam/mysql/conf:/etc/mysql \
-v /root/webTeam/mysql/logs:/var/log/mysql \
-v /root/webTeam/mysql/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=ljl1234 \
-d mysql-images