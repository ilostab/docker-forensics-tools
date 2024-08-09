# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Install unzip in case it's needed to extract the ZIP file
RUN apt-get update && apt-get install -y unzip

# Copy the thor10-linux-techpreview.zip file into the container at /run/
COPY thor10-linux-techpreview.zip /run/

# Unzip the contents to make them executable, if needed
RUN unzip /run/thor10-linux-techpreview.zip -d /run/ && \
    chmod +x /run/thor-linux /run/thor-linux-64

# Set up the entry point for executing the thor-linux binary
ENTRYPOINT ["/run/thor-linux-64"]