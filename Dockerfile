FROM ubuntu:xenial

LABEL authors="Tiago Oliveira <tiago.oliveira@gmx.us>, Hendrik Beneke <hendrik.beneke@agcocorp.com>"

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget

RUN cd /tmp; wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    apt-get update

RUN apt-get -y install erlang=1:20.3-1 \
                       elixir \
                       erlang-base-hipe \
                       build-essential \
                       git \
                       ant \
                       default-jdk \
                       zip \
                       xsltproc \
                       curl \
                       python

RUN apt-get install -y --no-install-recommends \
    locales \
    && export LANG=en_US.UTF-8 \
    && echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

VOLUME /data
VOLUME /build

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["make"]
