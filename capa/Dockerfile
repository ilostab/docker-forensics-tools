FROM python:3.9-slim-buster
LABEL description="capa installed from pip"
LABEL maintainer="Ilo, @ilostab"

RUN apt-get update

# Install capa using pip
RUN apt-get install -y python3 python3-pip curl wget unzip ca-certificates
RUN pip install flare-capa

# Install jq from the official JavaScript repository
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y jq && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app/ && \
    mkdir /app/rules/ && \
    CAPA_RULES_ZIP=$(curl -s https://api.github.com/repos/mandiant/capa-rules/releases/latest | jq -r '.zipball_url') && \
    curl -L $CAPA_RULES_ZIP -o /app/rules/capa-rules.zip && \
    unzip /app/rules/capa-rules.zip -d /app/rules && \
    rm /app/rules/capa-rules.zip

# Set the working directory (optional)
WORKDIR /app

# Define the entrypoint (optional, but useful for running capa directly)
ENTRYPOINT ["capa"]