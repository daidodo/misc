FROM alpine

#RUN apk --no-cache add \
RUN apk --update add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc linux-headers \
  vim ctags \
  automake make \
  openssh

# user & permission
RUN adduser dozerg -G root -D && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mkdir -p /home/dozerg/work && \
  chown -R dozerg /home/dozerg
  
#  cp ~/.vimrc ~/.bashrc ~dozerg/ && \
#  cp /etc/skel/.bash* /home/dozerg && \
#  mv ~/sys.tags ~/.vim ~dozerg/ && \

# sshd
RUN mkdir -p /var/run/sshd && \
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# manpages man-db manpages-dev google-perftools libgoogle-perftools-dev libprotobuf-dev libsnappy-dev lrzsz openssh-server  protobuf-compiler
  
EXPOSE 22

ENTRYPOINT [ "/usr/sbin/sshd" ]

CMD [ "-D" ]