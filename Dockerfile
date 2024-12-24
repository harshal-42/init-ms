FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get install -y azure-cli
# Add the script
COPY fetch-config.sh /app/fetch-config.sh
RUN chmod +x /app/fetch-config.sh

ENTRYPOINT ["/bin/sh", "-c", "echo test", "/app/fetch-config.sh"]
