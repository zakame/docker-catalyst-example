FROM perl:5.24

COPY cpanfile cpanfile.snapshot /code/

WORKDIR /code

ENV PERL_CARTON_PATH=/carton

RUN cpanm App::cpm \
    && cpm install -g Carton \
    && mkdir /carton /vendor \
    && useradd -m catalyst -g users \
    && chown -R catalyst:users /carton /vendor \
    && rm -fr /root/.cpanm /tmp/*

USER catalyst:users

RUN cpm install -L /carton \
    && rm -fr /home/catalyst/.cpanm /tmp/*

VOLUME /carton

VOLUME /vendor
