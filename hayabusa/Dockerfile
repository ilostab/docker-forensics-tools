# Use the official Rust image as a base
FROM rust:latest AS builder
LABEL description="hayabusa compiled from source"
LABEL maintainer="Ilo, @ilostab"

# Install system dependencies (libssl-dev)
RUN apt-get update && apt-get install -y libssl-dev git zlib1g-dev

# Set the working directory inside the container
WORKDIR /app

# Clone the hayabusa repository with submodules
RUN git clone --recursive https://github.com/Yamato-Security/hayabusa.git .

# Build hayabusa in release mode
RUN cargo build --release

# RUN DISTROLESS
FROM gcr.io/distroless/cc

# Copy the necessary files and directories from the builder stage
COPY --from=builder /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1
COPY --from=builder /app/target/release/hayabusa /app/
COPY --from=builder /app/rules /app/rules/
COPY --from=builder /app/config /app/config/

# Specify the command to run when the container starts
CMD ["./app/hayabusa"]