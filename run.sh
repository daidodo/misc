# start container

## Windows
docker run -d -p 127.0.0.1:22222:22 -p 127.0.0.1:6060:6060 --name dev -h dev --cap-add SYS_TIME --security-opt seccomp:unconfined --link db:mysql daidodo/dev

## Mac
docker run -d -p 127.0.0.1:22222:22 -p 127.0.0.1:6060:6060 --name dev -h dev --security-opt seccomp:unconfined --link db:mysql daidodo/dev

## alpine
docker run -d -p 127.0.0.1:22220:22 --name alpine -h alpine --security-opt seccomp:unconfined daidodo/dev:alpine

# ssh to container

ssh dozerg@localhost -p 22222

ssh dozerg@localhost -p 22220

# mysql

docker run -d --name db -e MYSQL_ROOT_PASSWORD=mysql mysql

mysql -h db -u root -p
