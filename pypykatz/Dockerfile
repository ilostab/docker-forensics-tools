# Base Image: Use a generic Debian-based image for wider compatibility
#FROM debian:buster-slim
FROM python:3.9-slim

LABEL description="pypykatz 0.6.6"
LABEL maintainer="Ilo, @ilostab"

# Environment Variables
ENV VIRTUAL_ENV=/app/pypykatz/venv
WORKDIR /app/pypykatz

# Install System Dependencies (Including python3-venv)
RUN apt-get update && apt-get install -y python3 python3-pip git libssl-dev libffi-dev python3-venv

# Upgrade Pip
RUN python3 -m pip install --upgrade pip

# Install specific pypykatz version
RUN pip3 install --no-cache-dir pypykatz==0.6.6

# Create Virtual Environment
RUN python3 -m venv venv

# Activate Virtual Environment
RUN . $VIRTUAL_ENV/bin/activate

# Set Entrypoint
ENTRYPOINT ["pypykatz"]