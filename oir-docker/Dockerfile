FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    gfortran \
    curl \
    cmake \
    git \
    libreadline-dev \
    libjpeg-dev \
    libpng-dev \
    ncurses-dev \
    imagemagick \
    graphicsmagick \
    libgraphicsmagick1-dev \
    unzip \
    gnuplot \
    libopenblas-dev \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/torch/distro.git /opt/torch --recursive \
 && cd /opt/torch \
 && ./install.sh

ENV PATH=/opt/torch/install/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/torch/install/lib

RUN git clone https://github.com/uw-biomedical-ml/oir.git /opt/oir \
 && cd /opt/oir \
 && git checkout bf75f9346064f1425b8b9408ab792b1531a86c64

WORKDIR /opt/oir

COPY vendor/nngraph /tmp/nngraph
COPY vendor/graphicsmagick /tmp/graphicsmagick

RUN cd /tmp/nngraph \
 && luarocks make nngraph-scm-1.rockspec \
 && cd /tmp/graphicsmagick \
 && luarocks make graphicsmagick-1.scm-0.rockspec

CMD ["/bin/bash"]
