# Build stage
FROM alpine:3.15 AS builder

ARG FISH_VERSION=2.7.1

RUN echo "Building Fish-${FISH_VERSION}"; \
    apk update && apk add --no-cache \
        curl \
        g++ \
        make \
        ncurses-dev \
        python3 \
        bash \
        bc \
        git \
        groff \
        libgcc \
        libstdc++ \
        mandoc-apropos \
        screen \
        sed \
        util-linux \
        vim

RUN curl \
        --location \
        --silent \
        https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz \
    | tar -xzf -

RUN cd fish-${FISH_VERSION} \
    && ./configure \
    && make \
    && make install

# Runtime stage
FROM alpine:3.15

RUN apk add --no-cache \
        bash \
        less \
        ncurses \
        openssh-client \
        python3 \
        sudo \
        coreutils \
        findutils \
        gawk \
        mandoc \
        libgcc \
        libstdc++ \
    && rm -rf /var/cache/apk/*

COPY --from=builder /usr/local/bin/fish /usr/local/bin/
COPY --from=builder /usr/local/share/fish /usr/local/share/fish

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
