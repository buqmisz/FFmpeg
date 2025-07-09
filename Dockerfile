FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  cmake \
  git \
  libtool \
  pkg-config \
  texinfo \
  yasm \
  zlib1g-dev \
  libx264-dev \
  libx265-dev \
  libvpx-dev \
  libfdk-aac-dev \
  libmp3lame-dev \
  libopus-dev \
  libass-dev \
  libfreetype6-dev \
  libfontconfig1-dev \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy source files
COPY . .

# Configure and build
RUN ./configure \
  --enable-gpl \
  --enable-libx264 \
  --enable-libx265 \
  --enable-libvpx \
  --enable-libfdk-aac \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libass \
  --enable-libfreetype && \
  make -j$(nproc) && \
  make install

# Set default command
CMD ["ffmpeg", "-version"]
