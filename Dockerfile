FROM debian:buster

MAINTAINER namazso <admin@namazso.eu>

USER root

RUN apt update \
	&& apt install -y \
	sqlite \
	curl \
	libmojo-sqlite-perl \
	libmojo-pg-perl \
	libmariadbd-dev \
	libpq-dev \
	git \
	build-essential \
	libssl-dev \
	libio-socket-ssl-perl \
	liblwp-protocol-https-perl \
	&& apt-get clean -y

RUN cpan Carton

COPY lufi /lufi
WORKDIR /lufi

RUN carton install --deployment --without=test
RUN mkdir -p /files

COPY run.sh .

VOLUME ["/files"]

CMD /bin/bash run.sh

HEALTHCHECK CMD curl --fail http://127.0.0.1:8081/ || exit 1
