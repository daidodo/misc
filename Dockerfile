FROM alpine

#RUN apk --no-cache add \
RUN apk update && apk add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc \
  vim ctags \
  automake make \
  linux-headers

WORKDIR /tmp/

# zlib
RUN wget http://zlib.net/zlib-1.2.8.tar.gz && tar -xzf zlib-1.2.8.tar.gz && cd zlib-1.2.8 && ./configure --prefix=/usr && make && make install && cd ..

# openssl
RUN wget http://www.openssl.org/source/openssl-1.1.0b.tar.gz
RUN wget http://mirrors.evowise.com/pub/OpenBSD/OpenSSH/portable/openssh-7.3p1.tar.gz

# manpages man-db manpages-dev google-perftools libgoogle-perftools-dev libprotobuf-dev libsnappy-dev lrzsz openssh-server  protobuf-compiler
  
#CMD [ "/bin/bash" ]