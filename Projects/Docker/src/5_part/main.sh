#!/bin/bash

gcc ./hello_w.c -o hello_w -lfcgi
spawn-fcgi -p 8080 ./hello_w
nginx -g "daemon off;"
service nginx start
#export DOCKER_CONTENT_TRUST=1

/bin/bash
