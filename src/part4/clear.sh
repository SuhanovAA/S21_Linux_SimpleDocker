#!/bin/bash

docker stop server_container
docker rm server_container
docker rmi my_docker