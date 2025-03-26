ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

RUN mkdir /duckdb && cd /duckdb && curl -LO https://github.com/duckdb/duckdb/releases/download/v1.2.0/duckdb_cli-linux-aarch64.zip && unzip duckdb_cli-linux-aarch64.zip

ARG DUCK_ZSHRC_FILE=/root/.zshrc.duck
ADD .zshrc.duck ${DUCK_ZSHRC_FILE}
RUN echo "source ${DUCK_ZSHRC_FILE}" >> ${ZSHRC_FILE}

WORKDIR /root/proj
