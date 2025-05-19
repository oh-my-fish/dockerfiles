FROM alpine:3.21.2

ARG  FISH_VERSION=4.0.2

RUN echo "Building Fish-${FISH_VERSION}"; \
    apk update \
    && apk add curl \
    && curl \
        --location \
        --silent \
        https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.xz \
        > fish-${FISH_VERSION}.tar.xz \
    && tar xf fish-${FISH_VERSION}.tar.xz # tar: invalid tar magic fix
RUN apk add \
        bash \
        bc \
        cmake \
        g++ \
        git \
        groff \
        less \
        libgcc \
        libstdc++ \
        make \
        ncurses \
        ncurses-dev \
        openssh-client \
        python3 \
        screen \
        sed \
        sudo \
        util-linux \
        vim
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN cd fish-${FISH_VERSION} \
    && make \
    && make install \
    && cd / \
    && rm -rf fish-${FISH_VERSION}*
RUN fish -c true \
    && adduser \
        -D \
        -u 1000 \
        -s /usr/local/bin/fish \
        nemo \
    && echo 'nemo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER nemo
WORKDIR /home/nemo

CMD ["fish"]
