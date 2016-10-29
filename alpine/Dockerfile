FROM alpine

MAINTAINER DoZerg "daidodo@gmail.com"

COPY ./ /tmp

ADD http://ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz /tmp

WORKDIR /tmp

RUN chmod +x *.sh && /tmp/init.sh

# manpages man-db manpages-dev 
# google-perftools libgoogle-perftools-dev libprotobuf-dev libsnappy-dev lrzsz   protobuf-compiler
  
EXPOSE 22

CMD [ "dropbear", "-RFmwg", "-p", "22" ]