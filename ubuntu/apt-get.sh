apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install \
  bash bash-completion bash-doc command-not-found \
  sudo git less \
  gcc g++ gdb gdb-doc \
  manpages man-db manpages-dev \
  vim exuberant-ctags \
  automake make\
  protobuf-compiler libprotobuf-dev \
  libgoogle-perftools-dev google-perftools \
  libsnappy-dev \
  openssh-server lrzsz libssl-dev libssl-doc
 
