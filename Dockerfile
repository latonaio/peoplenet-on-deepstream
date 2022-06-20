FROM nvcr.io/nvidia/deepstream-l4t:6.0.1-samples
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    wget \
    curl \
    zlib1g-dev \
    vim \
    git \
    pkg-config \
    python3 \
    python3-pip \
    python3-gi \
    python3-dev \
    python3-wheel \
    g++ \
    libglib2.0-dev \
    libglib2.0-dev-bin \
    python-gi-dev \
    libtool \
    m4 \
    autoconf \
    automake \
    sudo \
    ssh \
    pbzip2 \
    pv \
    bzip2 \
    unzip \
    cmake \
    build-essential \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstrtspserver-1.0-dev \
    libglew-dev \
    libssl-dev \
    libopencv-dev \
    freeglut3-dev \
    libjpeg-dev \
    libjson-glib-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libgtk-3-dev \
    libpng-dev \
    libgles2-mesa-dev \
    libegl1-mesa-dev \
    librabbitmq-dev

WORKDIR /app/src
COPY . .
RUN pip3 install -U pip
RUN pip3 install setuptools && \
    pip3 install pyds-1.1.1-py3-none-linux_aarch64.whl

CMD bash
