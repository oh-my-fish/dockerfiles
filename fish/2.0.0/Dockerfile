FROM alpine:3.4

RUN mkdir /fish
COPY *.patch /fish/
RUN apk add --no-cache bc curl g++ git groff libgcc libstdc++ make mdocml-apropos ncurses ncurses-dev sudo util-linux autoconf \
    && curl -OSs http://fishshell.com/files/2.0.0/fish-2.0.0.tar.gz \
    && tar xzf fish-2.0.0.tar.gz \
    && cd fish \
    && sed -i -e '21d' expand.cpp \
    && patch -p1 < 0001-Use-strerror-in-uClibc-which-doesn-t-have-sys_errlis.patch \
    && patch -p1 < 0001-Solaris-build-fixes-use-_sys_errs-if-available.patch \
    && autoconf \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish fish-2.0.0.tar.gz \
    && apk del --no-cache g++ make ncurses-dev autoconf \
    && fish -c true \
    && adduser -D -u 1000 -s /usr/local/bin/fish nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

CMD ["fish"]
