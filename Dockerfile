FROM debian:stable-slim
LABEL Maintainer="Marcabru onin@pm.me"
WORKDIR /usr/local/src
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y wget vim python3-pip

RUN python3 -m pip install requests websocket-client

RUN wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz \
    && tar -xvzf asterisk-18-current.tar.gz \ 
    && rm asterisk-18-current.tar.gz \
    && echo 'libvpb1 libvpb1/countrycode string 61' | debconf-set-selections -v \
    && cd asterisk-18* \
    && contrib/scripts/install_prereq install \
    && apt-get autoremove -y

RUN cd /usr/local/src/asterisk-18* \
    && ./configure \
    && make menuselect.makeopts \ 
    && menuselect/menuselect \
    --enable chan_pjsip \
    --enable res_http_websocket \
    make && \
    make install

RUN cd /usr/local/src/asterisk-18* \
    && make samples \
    && make config  \
    && ldconfig \
    && cp -rf /etc/asterisk/ /var/tmp/ \
    && rm -rf /etc/asterisk/*

COPY entrypoint.sh /

VOLUME [ "/etc/asterisk" ]

EXPOSE 5060/UDP
EXPOSE 443
EXPOSE 80
ENTRYPOINT [ "/entrypoint.sh" ]
#CMD ["-vvf"]
