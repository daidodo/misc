FROM alpine

MAINTAINER DoZerg "daidodo@gmail.com"

COPY ./ /tmp

ADD http://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz /tmp

ADD https://github.com/gperftools/gperftools/releases/download/gperftools-2.5/gperftools-2.5.tar.gz /tmp

WORKDIR /tmp

RUN chmod +x *.sh && ./init.sh

# google-perftools libgoogle-perftools-dev
# libunwind
  
EXPOSE 22

CMD [ "dropbear", "-RFmwg", "-p", "22" ]