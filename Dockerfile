FROM alpine

#RUN apk --no-cache add \
RUN apk --update add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc linux-headers \
  vim ctags \
  automake make \
  openssh-sftp-server openssh-client dropbear

# dropbear
RUN mkdir -p /etc/dropbear && \
  touch /var/log/lastlog

# user
RUN adduser dozerg -G root -D && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mkdir -p /home/dozerg/work && \
  chown -R dozerg /home/dozerg && \
  sed -ri 's/^dozerg.*/dozerg:x:1000:0::\/home\/dozerg:\/bin\/bash/' /etc/passwd
  
#  cp ~/.vimrc ~/.bashrc ~dozerg/ && \
#  cp /etc/skel/.bash* /home/dozerg && \
#  mv ~/sys.tags ~/.vim ~dozerg/ && \

# manpages man-db manpages-dev google-perftools libgoogle-perftools-dev libprotobuf-dev libsnappy-dev lrzsz openssh-server  protobuf-compiler
  
EXPOSE 22

#ENTRYPOINT [ "/usr/sbin/sshd" ]

CMD [ "dropbear", "-RFEmwg", "-p", "22" ]