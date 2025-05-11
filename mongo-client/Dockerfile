ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Mongo
RUN mkdir mongosh && cd mongosh && curl https://downloads.mongodb.com/compass/mongosh-2.5.1-linux-arm64.tgz -o mongosh.tgz && tar --strip-components=1 -xvf mongosh.tgz && rm mongosh.tgz

# Add Mongo zshrc file
ARG MONGO_ZSHRC_FILE=/root/.zshrc.mongo
ADD .zshrc.mongo ${MONGO_ZSHRC_FILE}
RUN chmod +x ${MONGO_ZSHRC_FILE}
RUN echo "source ${MONGO_ZSHRC_FILE}" >> ${ZSHRC_FILE}
