#!/bin/bash

service nginx start
spawn-fcgi -p 8080 ./webserver
tail -f /dev/null