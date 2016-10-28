FROM alpine

RUN apk --no-cache add \
  bash bash-completion bash-doc command-not-found \
  sudo git less \
  gcc g++ gdb gdb-doc \
  manpages man-db manpages-dev \
  vim exuberant-ctags \
  automake make\
  protobuf-compiler libprotobuf-dev \
  libgoogle-perftools-dev google-perftools \
  libsnappy-dev \
  openssh-server lrzsz libssl-dev libssl-doc \
  language-pack-zh-hans \

CMD [ "/bin/bash" ]