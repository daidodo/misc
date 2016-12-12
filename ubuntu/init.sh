#!/bin/bash

# vim & tags
/bin/bash -c "sed -i 's#^set path=.*#&`./gen_systags.sh`#' /tmp/1.vimrc" && \
    mv /tmp/1.vimrc ~/.vimrc && mkdir -p ~/.vim/spell && mv sysdict.ascii.spl ~/.vim/spell/ && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# user config
useradd dozerg -m -g root -s /bin/bash && \
    echo 'dozerg:dozerg' | chpasswd && \
    echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
    mv ~/sys.tags ~/.vimrc ~/.vim ~dozerg/ && \
    mv /tmp/1.bashrc ~dozerg/.bashrc && \
    mv /tmp/1.ycm_extra_conf.py ~dozerg/.ycm_extra_conf.py && \
    mv /tmp/1.gitconfig ~dozerg/.gitconfig && \
    cd ~dozerg/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --system-libclang && \
    git clone https://github.com/daidodo/marine.git ~dozerg/work/marine && \
    git clone https://github.com/daidodo/misc.git ~dozerg/work/misc && \
    chown -R dozerg /home/dozerg

# fix timezone, optional
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# sshd
mkdir -p /var/run/sshd
sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# clean up
rm -f /tmp/*.sh /tmp/1.*
