# Use an official Rust image as the base
FROM rust:slim-bullseye as builder

LABEL description="yara-x built from source"
LABEL maintainer="Ilo, @ilostab"

# Set the working directory within the container
WORKDIR /app

# Update package lists and install necessary tools
RUN apt-get update && \
    apt-get install -y git curl wget unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install jq from the official JavaScript repository
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/*

# Clone the yara-x source code into the container
RUN git clone https://github.com/VirusTotal/yara-x .

# Build the yara-x command-line interface (CLI)
# RUN cargo install --path cli
RUN cargo build --release

# Make a directory for rule sets
RUN mkdir /app/rules

RUN RESP=$(curl -s https://api.github.com/repos/YARAHQ/yara-forge/releases/latest | jq -r '[.assets | sort_by(.created_at) | reverse | .[] | .browser_download_url ]') && \
    CORE_ZIP=$(echo $RESP | jq -r '[.[] | select(. | contains("core"))][0]') && \
    EXTENDED_ZIP=$(echo $RESP | jq -r '[.[] | select(. | contains("extended"))][0]') && \
    FULL_ZIP=$(echo $RESP | jq -r '[.[] | select(. | contains("full"))][0]') && \
    curl -L $CORE_ZIP -o /app/rules/core.zip && \
    curl -L $EXTENDED_ZIP -o /app/rules/extended.zip && \
    curl -L $FULL_ZIP -o /app/rules/full.zip && \
    unzip -t /app/rules/core.zip && unzip /app/rules/core.zip -d /app/rules || (echo "Error: core.zip is corrupted" && exit 1) && \
    unzip -t /app/rules/extended.zip && unzip /app/rules/extended.zip -d /app/rules || (echo "Error: extended.zip is corrupted" && exit 1) && \
    unzip -t /app/rules/full.zip && unzip /app/rules/full.zip -d /app/rules || (echo "Error: full.zip is corrupted" && exit 1) && \
    rm /app/rules/*.zip

# RUN DISTROLESS
FROM gcr.io/distroless/cc

# Copy the necessary files and directories from the builder stage
COPY --from=builder /app/target/release/yara-x /app/
COPY --from=builder /app/rules /app/rules

# Specify the command to run when the container starts
CMD ["./app/yara-x"]
