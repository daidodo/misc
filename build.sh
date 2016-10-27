#!/bin/bash

docker build --shm-size 1024MB --force-rm -t test -f Dockerfile.base .
#docker build --shm-size 1024MB --force-rm -t test .
