ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install PostgreSQL Client
RUN apt install -y mariadb-client

# Add MYSQL zshrc file
ARG MYSQL_ZSHRC_FILE=/root/.zshrc.mysql
ADD .zshrc.mysql ${MYSQL_ZSHRC_FILE}
RUN chmod +x ${MYSQL_ZSHRC_FILE}
RUN echo "source ${MYSQL_ZSHRC_FILE}" >> ${ZSHRC_FILE}