#!/bin/bash

WORK_PATH='/root/webTeam/manage/'
cd $WORK_PATH
docker stop mysql-container
docker rm mysql-container
docker build -t mysql-images ./docker
docker run -itd --name mysql-container -p 9004:3306 -e MYSQL_ROOT_PASSWORD=ljl1234 mysql-images

