FROM alpine

RUN apk update

#RUN apk --no-cache add \
RUN apk add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc \
  vim ctags \
  automake make \
  openssl

WORKDIR /tmp/

RUN wget http://zlib.net/zlib-1.2.8.tar.gz && cd zlib-1.2.8 && ./configure --prefix=/usr && make && make install && cd ..

RUN wget http://mirrors.evowise.com/pub/OpenBSD/OpenSSH/portable/openssh-7.3p1.tar.gz

# manpages man-db manpages-dev google-perftools libgoogle-perftools-dev libprotobuf-dev libsnappy-dev lrzsz openssh-server  protobuf-compiler
  
#CMD [ "/bin/bash" ]