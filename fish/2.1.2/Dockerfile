FROM alpine:3.4

RUN mkdir /fish-2.1.2
COPY *.patch /fish-2.1.2/
RUN apk add --no-cache bc curl g++ git groff libgcc libstdc++ make mdocml-apropos ncurses ncurses-dev sudo util-linux autoconf \
    && curl -OSs http://fishshell.com/files/2.1.2/fish-2.1.2.tar.gz \
    && tar xzf fish-2.1.2.tar.gz \
    && cd fish-2.1.2 \
    && patch -p1 < 0001-Solaris-build-fixes-use-_sys_errs-if-available.patch \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-2.1.2 fish-2.1.2.tar.gz \
    && apk del --no-cache g++ make ncurses-dev autoconf \
    && fish -c true \
    && adduser -D -u 1000 -s /usr/local/bin/fish nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

CMD ["fish"]
