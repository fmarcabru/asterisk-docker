FROM debian:stable-slim
LABEL Maintainer="Marcabru onin@pm.me"
RUN apt-get update && apt-get upgrade -y && apt-get install wget -y
RUN cd /usr/local/src \
    && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz \
    && tar -xvzf asterisk-18-current.tar.gz \ 
    && rm asterisk-18-current.tar.gz \
    && echo 'libvpb1 libvpb1/countrycode string 61' | debconf-set-selections -v \
    && cd asterisk-18* \
    && contrib/scripts/install_prereq test \
    && apt-get -y install build-essential \
    libedit-dev \
    uuid-dev \
    libjansson-dev \
    libxml2-dev \
    #    && apt-get purge wget -y \
    && apt-get autoremove -y

RUN apt-get -y install sqlite3

RUN cd /usr/local/src/asterisk-18* \
    && ./configure \
    && make menuselect.makeopts \ 
    && menuselect/menuselect \
    --enable chan_pjsip \
    --enable res_http_websocket \
    #    make && \
    #    make install

    #RUN make samples && \
    #    make config && \
    #    ldconfig

    EXPOSE 5060
ENTRYPOINT [ "asterisk" ]
