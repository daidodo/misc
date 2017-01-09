#!/bin/bash

DIR="ubuntu"

#echo "Check vimrc"
diff ~/.vimrc $DIR/1.vimrc

#echo "Check bashrc"
diff ~/.bashrc $DIR/1.bashrc

#echo "Check ycm_extra_conf"
diff ~/.ycm_extra_conf.py $DIR/1.ycm_extra_conf.py

#echo "Check gitconfig"
diff ~/.gitconfig $DIR/1.gitconfig

#echo "Check ntp.conf"
diff /etc/ntp.conf $DIR/ntp.conf
