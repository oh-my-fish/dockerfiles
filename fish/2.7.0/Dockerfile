FROM alpine:3.8

RUN apk add --no-cache bc curl g++ git groff libgcc libstdc++ make mdocml-apropos ncurses ncurses-dev python sudo util-linux \
    && curl -Ls https://github.com/fish-shell/fish-shell/releases/download/2.7.0/fish-2.7.0.tar.gz | tar -xzf - \
    && cd fish-2.7.0 \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-2.7.0 \
    && apk del --no-cache g++ make ncurses-dev \
    && fish -c true \
    && adduser -D -u 1000 -s /usr/local/bin/fish nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

CMD ["fish"]
