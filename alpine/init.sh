# install
apk --no-cache add \
  bash bash-completion bash-doc \
  sudo git less \
  gcc g++ gdb gdb-doc linux-headers \
  vim ctags \
  automake make \
  openssh-sftp-server openssh-client dropbear

# config
if [ ! -d /etc/skel ] ; then
  mv skel /etc/
fi  

INC=`./gen_systags.sh`

while read line ; do
  if [ "${line:0:9}" = "set path=" ] ; then
    echo "$line$INC"
  else
    echo $line
  fi
done < 1.vimrc > /etc/skel/.vimrc

# user
adduser dozerg -G root -D && \
  echo 'dozerg:dozerg' | chpasswd && \
  echo 'dozerg  ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dozerg && \
  mkdir -p /home/dozerg/work && \
  git clone https://github.com/VundleVim/Vundle.vim.git /home/dozerg/.vim/bundle/Vundle.vim && \
  chown -R dozerg /home/dozerg

#vim +PluginInstall +qall

# dropbear
mkdir -p /etc/dropbear && \
  touch /var/log/lastlog && \
  sed -ri 's/^dozerg.*/dozerg:x:1000:0::\/home\/dozerg:\/bin\/bash/' /etc/passwd
  
# cleanup
rm -rf *
