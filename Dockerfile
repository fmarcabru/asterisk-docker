FROM debian:stable
LABEL Maintainer="Marcabru onin@pm.me"
RUN apt-get update && apt-get upgrade -y && apt-get install wget -y
RUN cd /usr/local/src && \
    wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz && \
    tar -xvzf asterisk-18-current.tar.gz && \ 
    rm asterisk-18-current.tar.gz && \
    cd asterisk-18* && \
    contrib/scripts/install_prereq && \
    apt purge wget


EXPOSE 5060
ENTRYPOINT [ "asterisk" ]
