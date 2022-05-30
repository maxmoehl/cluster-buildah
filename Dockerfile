FROM docker.io/library/ubuntu:jammy

RUN apt-get update && \
    apt-get install -y git curl jq buildah && \
    apt-get clean

ENTRYPOINT ["buildah"]
CMD ["-h"]
