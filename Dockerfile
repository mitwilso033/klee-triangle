
FROM ubuntu:latest

# Install necessary packages for AFL++ and build tools
RUN apt-get update && apt-get install -y \
    clang \
    llvm \
    make \
    gcc \
    gdb \
    lcov \
    zip \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/AFLplusplus/AFLplusplus.git
WORKDIR /opt/AFLplusplus
# Clean up previous builds and then build everything
RUN make clean all
# Install everything, ensuring it's installed to /usr/local/bin etc.
RUN sudo make install

# Set up environment variables for AFL++
ENV PATH="/usr/local/bin:${PATH}"
ENV AFL_PATH="/usr/local/share/afl"

WORKDIR /assignment