ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

RUN apt install -y gpg
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ $(cat /etc/os-release | grep VERSION_CODENAME | cut -d'=' -f2)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

# Install PostgreSQL Client
RUN apt update && apt install -y postgresql-client-17

# Add PG zshrc file
ARG PG_ZSHRC_FILE=/root/.zshrc.psql
ADD .zshrc.pg ${PG_ZSHRC_FILE}
ADD .psqlrc /root/.psqlrc
RUN chmod +x ${PG_ZSHRC_FILE}
RUN echo "source ${PG_ZSHRC_FILE}" >> ${ZSHRC_FILE}
