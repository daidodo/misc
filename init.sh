#!/bin/bash

chmod +x *.sh && \
  ./apt-get.sh && \
  useradd dozerg -g root && mkdir -p /home/dozerg && chown -R dozerg /home/dozerg

su dozerg

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

INC=`./gen_systags.sh`

while read line ; do
  if [ "${line:0:9}" = "set path=" ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > ~/.vimrc
