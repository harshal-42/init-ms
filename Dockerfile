FROM debian:latest
WORKDIR /
EXPOSE 8000

RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && apt-get install -y azure-cli
# Add the script
COPY fetch-config.sh /app/fetch-config.sh
RUN chmod +x /app/fetch-config.sh

ENTRYPOINT ["/bin/sh", "-c", "echo test"]
