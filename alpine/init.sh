#!/bin/bash

# tags & vim config
INC=`./gen_systags.sh`

while read line ; do
  if [ "${line:0:9}" = "set path=" ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > skel/.vimrc

#vim +PluginInstall +qall