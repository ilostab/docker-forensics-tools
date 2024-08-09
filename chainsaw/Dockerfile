# Use the official Rust image as a base
FROM rust:latest
LABEL description="chainsaw compiled from source"
LABEL maintainer="Ilo, @ilostab"

# Set the working directory inside the container
WORKDIR /app

# Clone the chainsaw repository with submodules
RUN git clone https://github.com/WithSecureLabs/chainsaw.git .

# Add sigmaHQ rules
RUN mkdir /app/rules/sigma/
RUN git clone https://github.com/SigmaHQ/sigma /app/rules/sigma/

# Build hayabusa in release mode
RUN cargo build --release

# Specify the command to run when the container starts (optional)
CMD ["./target/release/chainsaw"]