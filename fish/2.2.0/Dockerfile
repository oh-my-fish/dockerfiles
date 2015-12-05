FROM ubuntu

RUN echo "Installing fish"
RUN sudo apt-get install -y --no-install-recommends software-properties-common \
      && apt-add-repository ppa:fish-shell/release-2 \
      && apt-get update \
      && apt-get install -y --no-install-recommends \
        fish \
      && rm -rf /var/lib/apt/lists/*

RUN echo "Installing Oh My Fish test dependencies"
RUN sudo apt-get update \
      && sudo apt-get install -y --no-install-recommends \
        curl git tree \
      && rm -rf /var/lib/apt/lists/*

