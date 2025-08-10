ARG DEBIAN_VERSION="bookworm"
FROM debian:${DEBIAN_VERSION} AS starter
ARG TARGETPLATFORM

RUN apt -y update && apt -y upgrade && apt install -y wget unzip
WORKDIR /tmp

RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        echo "Running on ARM64 platform"; \
        wget https://github.com/duckdb/duckdb/releases/download/v1.3.2/duckdb_cli-linux-arm64.zip -O duckdb.zip; \
    else \
        echo "Running on x86_64 platform"; \
        wget https://github.com/duckdb/duckdb/releases/download/v1.3.2/duckdb_cli-linux-amd64.zip -O duckdb.zip; \
    fi

RUN unzip duckdb.zip && rm duckdb.zip

ARG DEBIAN_VERSION="bookworm"
FROM debian:${DEBIAN_VERSION}
WORKDIR /root/proj
COPY --from=starter /tmp/duckdb /duckdb/duckdb

ENTRYPOINT [ "/duckdb/duckdb" ]
