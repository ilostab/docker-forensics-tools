# Use the official Rust image as a base
FROM rust:latest
LABEL description="hayabusa compiled from source"
LABEL maintainer="Ilo, @ilostab"

# Install system dependencies (libssl-dev)
RUN apt-get update && apt-get install -y libssl-dev

# Set the working directory inside the container
WORKDIR /app

# Clone the hayabusa repository with submodules
RUN git clone --recursive https://github.com/Yamato-Security/hayabusa.git .

# Build hayabusa in release mode
RUN cargo build --release

# Specify the command to run when the container starts (optional)
CMD ["./target/release/hayabusa"]