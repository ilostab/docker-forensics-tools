FROM ubuntu:latest
LABEL description="densityscout 4.5"
LABEL maintainer="Ilo, @ilostab"

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L https://www.cert.at/media/files/downloads/software/densityscout/files/densityscout_build_45_linux.zip -o densityscout.zip && \
    unzip densityscout.zip -d /app/ && \
    chmod +x /app/lin64/densityscout

# Optionally, add the directory to PATH if you want to run it directly
ENV PATH="/app/lin64:${PATH}"

CMD ["/app/lin64/densityscout"]