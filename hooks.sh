#!/bin/bash

git reset --hard origin/master
git clean -f
git pull origin master
docker build -t hooks-images .
docker stop hooks-container
docker rm hooks-container
docker run -itd -p 9003:9003 --name hooks-container  hooks-images

