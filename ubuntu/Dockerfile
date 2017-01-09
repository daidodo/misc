FROM ubuntu

MAINTAINER DoZerg "daidodo@gmail.com"

COPY init.sh apt-get.sh gen_systags.sh 1.vimrc 1.bashrc 1.ycm_extra_conf.py 1.gitconfig ntp.conf sysdict.ascii.spl /tmp/

WORKDIR /tmp

RUN chmod +x *.sh && ./apt-get.sh && ./init.sh

EXPOSE 22

ENTRYPOINT [ "/usr/sbin/sshd" ]

CMD [ "-D" ]
