FROM quay.io/nushell/nu:latest

WORKDIR /opt

RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && \
    apt-get -y install git && \
    apt-get clean && \
    git clone https://github.com/pbackz/nushell-utils

WORKDIR /opt/nushell-utils

ENTRYPOINT ["nu"]