#!/bin/bash

docker run -d -p 127.0.0.1:22222:22 --name ubuntu -h ubuntu daidodo/dev

docker run -d -p 127.0.0.1:22220:22 --name alpine -h alpine daidodo/dev:alpine
