# start container

docker run -d -p 127.0.0.1:22222:22 --name dev -h dev --security-opt seccomp:unconfined daidodo/dev

docker run -d -p 127.0.0.1:22220:22 --name alpine -h alpine --security-opt seccomp:unconfined daidodo/dev:alpine

# ssh to container

ssh dozerg@localhost -p 22222

ssh dozerg@localhost -p 22220
