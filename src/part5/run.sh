#!/bin/bash

docker build -t img:new .
docker run -d -p 80:81 --name temp img:new