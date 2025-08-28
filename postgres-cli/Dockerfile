ARG DEBIAN_VERSION="bookworm"
FROM debian:${DEBIAN_VERSION}

RUN apt update && apt install -y gpg curl
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ $(cat /etc/os-release | grep VERSION_CODENAME | cut -d'=' -f2)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

# Install PostgreSQL Client
RUN apt update && apt install -y postgresql-client-17

# Add PG zshrc file
ARG LAUNCH_PG_SCRIPT=/root/launch-psql.sh
ADD launch-psql.sh ${LAUNCH_PG_SCRIPT}
RUN chmod +x ${LAUNCH_PG_SCRIPT}

ADD .psqlrc /root/.psqlrc

ENTRYPOINT [ "/root/launch-psql.sh" ]
