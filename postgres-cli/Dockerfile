ARG RELEASE
FROM basic-env:${RELEASE}

# Install PostgreSQL Client
RUN apt install -y postgresql-client-13

# Add PG zshrc file
ARG PG_ZSHRC_FILE=/root/.zshrc.psql
ADD .zshrc.pg ${PG_ZSHRC_FILE}
RUN chmod +x ${PG_ZSHRC_FILE}
RUN echo "source ${PG_ZSHRC_FILE}" >> ${ZSHRC_FILE}
 