#!/bin/bash

docker build -t img .
docker run -d -p 80:81 --name temp img