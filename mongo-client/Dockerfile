ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Mongo
RUN curl -O https://downloads.mongodb.com/compass/mongodb-mongosh_1.10.6_arm64.deb
RUN apt install -y ./mongodb-mongosh_1.10.6_arm64.deb
RUN rm ./mongodb-mongosh_1.10.6_arm64.deb

# Add Mongo zshrc file
ARG MONGO_ZSHRC_FILE=/root/.zshrc.mongo
ADD .zshrc.mongo ${MONGO_ZSHRC_FILE}
RUN chmod +x ${MONGO_ZSHRC_FILE}
RUN echo "source ${MONGO_ZSHRC_FILE}" >> ${ZSHRC_FILE}
