ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install PostgreSQL Client
RUN apt install -y postgresql-client

# Add PG zshrc file
ARG PG_ZSHRC_FILE=/root/.zshrc.psql
ADD .zshrc.pg ${PG_ZSHRC_FILE}
ADD .psqlrc /root/.psqlrc
RUN chmod +x ${PG_ZSHRC_FILE}
RUN echo "source ${PG_ZSHRC_FILE}" >> ${ZSHRC_FILE}
