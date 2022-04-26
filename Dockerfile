FROM debian:stable
LABEL Maintainer="Marcabru onin@pm.me"
RUN apt update && apt upgrade -y
RUN cd /usr/local/src && \
    wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz && \
    tar -xvzf asterisk-18-current.tar.gz && \ ./contrib/scripts/install_prereq


