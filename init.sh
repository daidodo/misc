#!/bin/bash

# install softwares
./apt-get.sh

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall

# tags & vim config
INC=`./gen_systags.sh`

while read line ; do
  if [ $line = "set path="* ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > ~/.vimrc

# user & permission
useradd dozerg -g root && \
  mkdir -p /home/dozerg/work && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mv ~/sys.tags ~/.vim ~dozerg/ && cp ~/.vimrc ~/.bashrc ~dozerg/ && \
  chown -R dozerg /home/dozerg

# sshd
mkdir -p /var/run/sshd
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# clean up
rm -f *.sh 1.*
