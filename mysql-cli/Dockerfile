ARG DEBIAN_VERSION="bookworm"
FROM debian:${DEBIAN_VERSION}

# Install MySQL Client - mariadb-client is a drop-in replacement for mysql-client
RUN apt update && apt install -y mariadb-client 

# Add MYSQL zshrc file
ARG LAUNCH_MYSQL_SCRIPT=/root/launch-mysql.sh
ADD launch-mysql.sh ${LAUNCH_MYSQL_SCRIPT}
RUN chmod +x ${LAUNCH_MYSQL_SCRIPT}

ENTRYPOINT [ "/root/launch-mysql.sh" ]