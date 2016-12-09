#!/bin/bash

INC=`./gen_systags.sh`

while read line ; do
  if [ "${line:0:9}" = "set path=" ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > ~/.vimrc

# vim plugins
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle && \
  git clone --recursive https://github.com/VundleVim/Vundle.vim.git && \
  git clone --recursive https://github.com/Valloric/YouCompleteMe && \
  git clone --recursive https://github.com/rdnetto/YCM-Generator && \
  git clone --recursive https://github.com/SirVer/ultisnips && \
  git clone --recursive https://github.com/honza/vim-snippets && \
  git clone --recursive https://github.com/vim-airline/vim-airline && \
  git clone --recursive https://github.com/vim-airline/vim-airline-themes && \
  git clone --recursive https://github.com/tpope/vim-fugitive && \
  git clone --recursive https://github.com/majutsushi/tagbar

# user
useradd dozerg -m -g root -s /bin/bash && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mv ~/sys.tags ~/.vimrc ~/.vim ~dozerg/ && \
  mv /tmp/1.bashrc ~dozerg/.bashrc && \
  mv /tmp/1.ycm_extra_conf.py ~dozerg/.ycm_extra_conf.py && \
  mv /tmp/1.gitconfig ~dozerg/.gitconfig && \
  cd  ~dozerg/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang

# work directory
mkdir -p /home/dozerg/work && cd /home/dozerg/work && \
  git clone --recursive https://github.com/daidodo/marine.git && \
  git clone --recursive https://github.com/daidodo/misc.git

# permission
chown -R dozerg /home/dozerg

# fix timezone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# sshd
mkdir -p /var/run/sshd
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# clean up
cd /tmp
rm -f *.sh 1.*
