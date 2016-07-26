FROM alpine:3.4

RUN apk add --no-cache curl g++ git groff libgcc libstdc++ make mdocml-apropos ncurses ncurses-dev util-linux \
    && curl -OSs http://fishshell.com/files/2.3.1/fish-2.3.1.tar.gz \
    && tar xzf fish-2.3.1.tar.gz \
    && cd fish-2.3.1 \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-2.3.1 fish-2.3.1.tar.gz \
    && apk del --no-cache g++ make ncurses-dev \
    && fish -c true

CMD ["fish"]
