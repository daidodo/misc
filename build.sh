#!/bin/bash

docker build --force-rm -t base -f Dockerfile.base .

docker build --shm-size 1024MB --force-rm -t dev .
