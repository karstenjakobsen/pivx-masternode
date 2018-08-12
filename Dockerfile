FROM ubuntu:16.04
MAINTAINER Karsten Kaj Jakobsen <karsten@karstenjakobsen.dk>

ENV DEBIAN_FRONTEND=noninteractive
ENV PIVX_VERSION=3.1.1

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
      apt-utils \
      git \
      libwww-perl \
      build-essential \
      libtool \
      automake \
      autotools-dev \
      autoconf \
      pkg-config \
      libssl-dev \
      libgmp3-dev \
      libevent-dev \
      bsdmainutils \
      libdb++-dev \
      libboost-all-dev \
      libqrencode-dev \
      libminiupnpc-dev \
      libcurl4-openssl-dev \
      libdb-dev \
      libdb++-dev \
      unzip \
      wget

RUN apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Set workdir and extract package
WORKDIR /usr/local/src
RUN wget -O pivx.tar.gz https://github.com/PIVX-Project/PIVX/releases/download/v$PIVX_VERSION/pivx-$PIVX_VERSION-x86_64-linux-gnu.tar.gz

RUN mkdir pivx && tar -xf pivx.tar.gz -C /usr/local/src/pivx --strip-components=1

WORKDIR /usr/local/src/pivx/bin

# Copy our entrypoint file
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
