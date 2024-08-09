# Use an official Rust image as the base
FROM rust:1.72.1-slim-buster

LABEL description="sidr built from source"
LABEL maintainer="Ilo, @ilostab"

# Set up a working directory within the container
WORKDIR /app

# Install git to clone the repository
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/strozfriedberg/sidr.git

# Change to the cloned repository
WORKDIR /app/sidr

# Build the project in release mode
RUN cargo build --release

# Specify the command to run when the container starts
CMD ["./target/release/sidr"]