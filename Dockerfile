FROM ubuntu:16.04
COPY --chown=1000:1000 ./garrycoin.conf /root/.garrycoin/garrycoin.conf
COPY --chown=1000:1000 . /garrycoin
WORKDIR /garrycoin
RUN apt update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
RUN apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev
RUN apt-get install -y libminiupnpc-dev
RUN apt-get install -y libzmq3-dev
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
# EXPOSE 9666 19666
# CMD ["garrycoind", "--printtoconsole"]