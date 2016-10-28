FROM alpine

RUN apk --no-cache add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc \
  vim ctags \
  automake make \
  protobuf-compiler libprotobuf-dev \
  libgoogle-perftools-dev google-perftools \
  libsnappy-dev \
  openssh-server lrzsz libssl-dev libssl-doc \
  language-pack-zh-hans \

# command-not-found exuberant-ctags manpages man-db manpages-dev
  
#CMD [ "/bin/bash" ]