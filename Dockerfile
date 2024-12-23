FROM busybox:1.28
WORKDIR /
EXPOSE 8000

ENTRYPOINT ["/bin/sh", "-c", "echo test"]
