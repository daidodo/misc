FROM base

MAINTAINER DoZerg "daidodo@gmail.com"

WORKDIR /tmp/

RUN chmod +x *.sh && ./init.sh

EXPOSE 22

ENTRYPOINT [ "/usr/sbin/sshd" ]

CMD [ "-D" ]
