#!/bin/bash

echo "------DOCKER BUILD------"
echo "\n>docker build -t my_docker ."
docker build -t my_docker .

echo "\n------DOCKER RUN------"
echo "\n>docker run -d -p 80:81 -v /home/vm/part4/nginx/nginx.conf:/etc/nginx/nginx.conf --name server_container my_docker"
docker run -d -p 80:81 -v /home/vm/part4/nginx/nginx.conf:/etc/nginx/nginx.conf --name server_container my_docker

echo "\n------DOCKER INFO------"
echo "\n>docker images"
docker images
echo "\n>docker ps"
docker ps

echo "\nPress ENTER" 
read enter

echo "\n------DOCKER CURL------"
echo "\n>curl localhost:80"
curl localhost:80

echo "\n------CLEAR IMG------"
sh clear.sh