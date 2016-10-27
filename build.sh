#!/bin/bash

docker build --shm-size 1024M --force-rm -t test .
