ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION} AS starter
ARG TARGETPLATFORM

RUN apt-get update && apt-get install -y curl;

WORKDIR /tmp
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        echo "Running on ARM64 platform"; \
        curl https://downloads.mongodb.com/compass/mongosh-2.5.6-linux-arm64.tgz -o mongosh.tgz; \
    else \
        echo "Running on x86_64 platform"; \
        curl https://downloads.mongodb.com/compass/mongosh-2.5.6-linux-x64.tgz -o mongosh.tgz; \
    fi

ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION}
WORKDIR /mongosh
COPY --from=starter /tmp/mongosh.tgz /mongosh/mongosh.tgz

# Install Mongo
RUN tar --strip-components=1 -xvf mongosh.tgz && rm mongosh.tgz

ADD launch-mongosh.sh /mongosh/launch-mongosh.sh
RUN chmod +x launch-mongosh.sh

ENTRYPOINT [ "/mongosh/launch-mongosh.sh" ]