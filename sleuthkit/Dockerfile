# Use the latest Ubuntu image
FROM ubuntu:latest

# Set environment variables to reduce interaction during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    automake \
    bison \
    autopoint \
    libtool \
    default-jdk \
    git \
    flex \
    wget \
    curl \
    pkg-config \
    libfuse-dev \
    zlib1g-dev \
    libssl-dev

# Install AFFLIB (from source)
RUN git clone https://github.com/sshock/AFFLIBv3.git /usr/src/afflib && \
    cd /usr/src/afflib && ./bootstrap.sh && ./configure && make && make install

# Install LibEWF from official repo
RUN git clone https://github.com/libyal/libewf-legacy.git /usr/src/libewf && \
    cd /usr/src/libewf && \
    ./synclibs.sh && \
    ./autogen.sh && \
    ./configure --enable-shared && \
    make && \
    make install

# Install Libvhdi (from source)
RUN git clone https://github.com/libyal/libvhdi.git /usr/src/libvhdi && \
    cd /usr/src/libvhdi && ./synclibs.sh && ./autogen.sh && ./configure && make && make install

# Install LibVMDK
RUN git clone https://github.com/libyal/libvmdk.git /usr/src/libvmdk && \
    cd /usr/src/libvmdk && \
    ./synclibs.sh && \
    ./autogen.sh && \
    ./configure --enable-shared && \
    make && \
    make install

# Install Libvslvm (from source)
RUN git clone https://github.com/libyal/libvslvm.git /usr/src/libvslvm && \
    cd /usr/src/libvslvm && ./synclibs.sh && ./autogen.sh && ./configure && make && make install

# Install Libbfio (dependency for Libvslvm)
RUN git clone https://github.com/libyal/libbfio.git /usr/src/libbfio && \
    cd /usr/src/libbfio && ./synclibs.sh && ./autogen.sh && ./configure && make && make install

# Clone the Sleuth Kit repository
RUN git clone https://github.com/sleuthkit/sleuthkit.git /usr/src/sleuthkit

# Set the working directory to the sleuthkit directory
WORKDIR /usr/src/sleuthkit

# Bootstrap and configure the build system, with support for all libraries
RUN ./bootstrap && ./configure --prefix=/usr/local \
    --with-afflib=/usr/local \
    --with-libewf=/usr/local \
    --with-libvhdi=/usr/local \
    --with-libvmdk=/usr/local \
    --with-libvslvm=/usr/local \
    --with-libbfio=/usr/local

# Compile and install Sleuth Kit
RUN make && make install

# Add /usr/local/bin to PATH
ENV PATH="/usr/local/bin:$PATH"

# Set library paths
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

# Default command to run bash
CMD ["/bin/bash"]
