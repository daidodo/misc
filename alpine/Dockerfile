FROM alpine

MAINTAINER DoZerg "daidodo@gmail.com"

COPY ./ /tmp

ADD http://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz /tmp

WORKDIR /tmp

RUN chmod +x *.sh && ./init.sh

# google-perftools libgoogle-perftools-dev libsnappy-dev 
  
EXPOSE 22

CMD [ "dropbear", "-RFmwg", "-p", "22" ]