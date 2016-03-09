FROM ubuntu:trusty

MAINTAINER Tiago Oliveira <tiago.oliveira@gmx.us>

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget

RUN cd /tmp; wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get -y install erlang erlang-base-hipe build-essential git ant openjdk-7-jdk zip xsltproc

VOLUME /data
VOLUME /build

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["make"]
