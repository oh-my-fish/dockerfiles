FROM alpine:3.4

RUN apk add --no-cache curl g++ git libgcc libstdc++ make mdocml-apropos ncurses ncurses-dev \
    && curl -OSs http://fishshell.com/files/2.3.0/fish-2.3.0.tar.gz \
    && tar xzf fish-2.3.0.tar.gz \
    && cd fish-2.3.0 \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-2.3.0 fish-2.3.0.tar.gz \
    && apk del --no-cache g++ make ncurses-dev \
    && fish -c true

CMD ["fish"]
