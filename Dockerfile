FROM perl:5.24

COPY cpanfile /code/

WORKDIR /code

ENV PERL_CARTON_PATH=/carton

RUN cpanm Carton \
    && mkdir /carton /vendor \
    && useradd -m catalyst -g users \
    && chown -R catalyst:users /carton /vendor \
    && rm -fr /root/.cpanm /tmp/*

USER catalyst:users

VOLUME /carton

VOLUME /vendor
