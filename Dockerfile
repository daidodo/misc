FROM ubuntu

MAINTAINER DoZerg "daidodo@gmail.com"

COPY init.sh apt-get.sh gen_systags.sh 1.vimrc /tmp/

WORKDIR /tmp/

RUN chmod +x *.sh && ./init.sh

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]
