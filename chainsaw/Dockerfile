# Use the official Rust image as a base
FROM rust:slim-bullseye as builder
LABEL description="chainsaw compiled from source"
LABEL maintainer="Ilo, @ilostab"

# Set the working directory inside the container
WORKDIR /app

# Update and install git
RUN apt-get update && apt-get install -y git

# Clone the chainsaw repository
RUN git clone https://github.com/WithSecureLabs/chainsaw.git .

# Build hayabusa in release mode
RUN cargo build --release

# Add sigmaHQ rules within the builder stage
RUN mkdir -p /app/rules/sigma/  # Create the directory structure
RUN git clone https://github.com/SigmaHQ/sigma /app/rules/sigma/

# RUN DISTROLESS
FROM gcr.io/distroless/cc

# Copy the necessary files and directories from the builder stage
COPY --from=builder /app/target/release/chainsaw /app/
COPY --from=builder /app/rules /app/rules

# Specify the command to run when the container starts
CMD ["./app/chainsaw"]