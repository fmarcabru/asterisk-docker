FROM debian:stable-slim
LABEL Maintainer="Marcabru onin@pm.me"
RUN apt-get update && apt-get upgrade -y && apt-get install wget -y
RUN cd /usr/local/src \
    && wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz \
    && tar -xvzf asterisk-18-current.tar.gz \ 
    && rm asterisk-18-current.tar.gz \
    #    && cd asterisk-18* \
    #    && contrib/scripts/install_prereq test \
    && apt-get purge wget -y

RUN apt-get install -y binutils-dev \
    bison \
    build-essential \
    doxygen \
    flex \
    freetds-dev \
    graphviz \
    libasound2-dev \
    libbluetooth-dev \
    libc-client2007e-dev \
    libcap-dev \
    libcfg-dev \
    libcodec2-dev \
    libcorosync-common-dev \
    libcpg-dev \
    libcurl4-openssl-dev \
    libedit-dev \
    libfftw3-dev \
    libgmime-3.0-dev \
    libgsm1-dev \
    libical-dev \
    libiksemel-dev \
    libjack-jackd2-dev \
    libjansson-dev \
    libldap2-dev \
    liblua5.2-dev \
    libneon27-dev \
    libnewt-dev \
    libogg-dev \
    libosptk-dev \
    libpopt-dev \
    libpq-dev \
    libradcli-dev \
    libresample1-dev \
    libsndfile1-dev \
    libsnmp-dev \
    libspandsp-dev \
    libspeex-dev \
    libspeexdsp-dev \
    libsqlite3-dev \
    libsrtp2-dev \
    libssl-dev \
    libunbound-dev \
    liburiparser-dev \
    libvorbis-dev \
    libvpb-dev \
    libxml2-dev \
    libxslt1-dev \
    patch \
    pkg-config \
    pkgconf \
    portaudio19-dev \
    subversion \
    unixodbc-dev \
    uuid-dev \
    xmlstarlet \
    zlib1g-dev

EXPOSE 5060
ENTRYPOINT [ "asterisk" ]
