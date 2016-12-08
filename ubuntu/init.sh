#!/bin/bash

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

INC=`./gen_systags.sh`

while read line ; do
  if [ "${line:0:9}" = "set path=" ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > ~/.vimrc

# vim plugins
vim +PluginInstall +qall

# user & permission & plugins
useradd dozerg -m -g root -s /bin/bash && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mv ~/sys.tags ~/.vimrc ~/.vim ~dozerg/ && \
  mv 1.bashrc ~dozerg/.bashrc && \
  mv 1.ycm_extra_conf.py ~dozerg/.ycm_extra_conf.py && \
  cd  ~dozerg/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

mkdir -p /home/dozerg/work && \
  cd /home/dozerg/work && git clone https://github.com/daidodo/marine.git

chown -R dozerg /home/dozerg

# sshd
mkdir -p /var/run/sshd
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# clean up
cd /tmp
rm -f *.sh 1.*