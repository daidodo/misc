#!/bin/bash

# build
docker build --force-rm -t dev -f Dockerfile .

# run
docker run -d -p 127.0.0.1:22222:22 -p 127.0.0.1:6060:6060 -p 127.0.0.1:8080:8080 --name dev -h dev dev
