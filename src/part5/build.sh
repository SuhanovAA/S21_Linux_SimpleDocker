#!/bin/bash

echo "\033[37;1;41m------DOCKER BUILD------\033[0m"
echo "\033[34;1;42m>docker build\033[0m"
docker build . -t my_docker:p5

echo "\033[37;1;41m------DOCKER RUN------\033[0m"
echo "\033[34;1;42m>docker run\033[0m"
docker run -d -it --user root -p 80:81 \
    -v /home/vm/part4/nginx/nginx.conf:/etc/nginx/nginx.conf \
    --name server_container my_docker:p5