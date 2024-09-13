# Use an official Rust image as the base
FROM rust:slim-bullseye AS builder

LABEL description="sidr built from source"
LABEL maintainer="Ilo, @ilostab"

# Set up a working directory within the container
WORKDIR /app

# Install git to clone the repository
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/strozfriedberg/sidr.git .

# Change to the cloned repository
WORKDIR /app/

# Build the project in release mode
RUN cargo build --release

# RUN DISTROLESS
FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/sidr /app/

# Add path to run
ENV PATH="/app:${PATH}"

# Specify the command to run when the container starts
CMD ["./app/sidr"]