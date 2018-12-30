FROM alpine:3.8

ARG  FISH_VERSION=3.0.0
RUN apk add --no-cache \
    bc \
    curl \
    g++ \
    git \
    groff \
    libgcc \
    libstdc++ \
    make \
    mdocml-apropos \
    ncurses \
    ncurses-dev \
    python \
    sudo \
    util-linux \
    && curl -Ls https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz | tar -xzf - \
    && cd fish-${FISH_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-${FISH_VERSION} \
    && apk del --no-cache g++ make ncurses-dev \
    && fish -c true \
    && adduser -D -u 1000 -s /usr/local/bin/fish nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

CMD ["fish"]