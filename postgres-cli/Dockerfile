FROM basic-env:2.0.0

# Install PostgreSQL Client
RUN apk add postgresql

ENV PG_ZSHRC_FILE=/root/.zshrc.psql

ADD .zshrc.pg ${PG_ZSHRC_FILE}
RUN chmod +x ${PG_ZSHRC_FILE}

RUN echo "source ${PG_ZSHRC_FILE}" >> ${ZSHRC_FILE}
