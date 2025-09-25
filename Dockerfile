FROM arm64v8/debian:stable-slim

# Non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Install ARM64 cross-toolchain, libraries, QEMU, and utilities
RUN apt-get update && apt-get install -y \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    libc6-dev-arm64-cross \
    crossbuild-essential-arm64 \
    qemu-user-static \
    file \
    make \
    vim \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for cross-compilation
ENV CC=aarch64-linux-gnu-gcc \
    CXX=aarch64-linux-gnu-g++ \
    AR=aarch64-linux-gnu-ar \
    AS=aarch64-linux-gnu-as \
    LD=aarch64-linux-gnu-ld

# Set working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
