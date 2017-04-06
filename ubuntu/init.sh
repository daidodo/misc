#!/bin/bash

# vim & tags & ...
/bin/bash -c "sed -i 's#^set path=.*#&`./gen_systags.sh`#' /tmp/1.vimrc" && \
  mv /tmp/1.vimrc ~/.vimrc && mkdir -p ~/.vim/spell && mv sysdict.ascii.spl ~/.vim/spell/ && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall && \
  mkdir -p ~/work && export GOPATH=~/work GOBIN=/usr/lib/go/bin && /tmp/go-get.sh && \
  gem install travis && \
  npm install -g grunt-cli bower

# user config
useradd dozerg -m -g root -s /bin/bash && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mv -f ~/* ~dozerg/ && \
  mv /tmp/1.bashrc ~dozerg/.bashrc && \
  mv /tmp/1.ycm_extra_conf.py ~dozerg/.ycm_extra_conf.py && \
  mv /tmp/1.gitconfig ~dozerg/.gitconfig && \
  cd ~dozerg/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang && \
  git clone --recursive https://github.com/daidodo/marine_doc.git ~dozerg/work/marine_doc && \
  git clone --recursive https://github.com/daidodo/misc.git ~dozerg/work/misc && \
  chown -R dozerg /home/dozerg

# time-sync and timezone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && mv /tmp/ntp.conf /etc/

# sshd
mkdir -p /var/run/sshd && \
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# clean up
rm -f /tmp/*.sh /tmp/1.*
