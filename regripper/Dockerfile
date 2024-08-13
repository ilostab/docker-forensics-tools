# Base image with Perl installed
FROM perl:5.32-slim

LABEL description="regripper 4.0"
LABEL maintainer="Ilo, @ilostab"

# Set working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    make \
    cpanminus \
    && rm -rf /var/lib/apt/lists/*

# Clone the RegRipper4.0 repository and make files in . available for rip.pl. Such as time.pl
RUN git clone https://github.com/keydet89/RegRipper4.0.git . && \
        sed -i '1i use lib ".";' rip.pl 

RUN cpanm --notest Parse::Win32Registry || true

# Set the entrypoint to the RegRipper tool
ENTRYPOINT ["perl", "rip.pl"]

# Default command to display help
CMD ["-h"]