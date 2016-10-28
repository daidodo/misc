FROM alpine

RUN apk --no-cache add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc \
  vim ctags \
  automake make 


# command-not-found exuberant-ctags manpages man-db manpages-dev google-perftools language-pack-zh-hans libgoogle-perftools-dev libprotobuf-dev libsnappy-dev libssl-dev libssl-doc lrzsz openssh-server  protobuf-compiler
  
#CMD [ "/bin/bash" ]