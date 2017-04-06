apt-get -y update && \
  apt-get -y upgrade && \
  apt-get -y install \
  bash bash-completion bash-doc command-not-found \
  sudo git less net-tools iputils-ping sysstat ntp \
  gcc g++ gdb gdb-doc strace ltrace \
  golang-go golang-golang-x-tools \
  clang libclang-dev \
  python-dev python3-dev \
  doxygen doxygen-doc texlive-latex-base \
  npm nodejs-legacy nodejs \
  manpages man-db manpages-dev \
  vim exuberant-ctags dos2unix \
  automake make cmake build-essential \
  protobuf-compiler libprotobuf-dev libsnappy-dev \
  libgoogle-perftools-dev google-perftools \
  openssh-server lrzsz libssl-dev libssl-doc \
  zip unzip
