FROM basic-env:3.0.0

# Install Mongo
RUN cp /etc/apt/sources.list /etc/apt/sources.list.${DEBIAN_VERSION}
RUN echo "deb [trusted=yes] http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main"  > /etc/apt/sources.list 
RUN apt -y update && apt install -y mongodb-org
RUN mv /etc/apt/sources.list.${DEBIAN_VERSION} /etc/apt/sources.list

# Add Mongo zshrc file
ARG MONGO_ZSHRC_FILE=/root/.zshrc.mongo
ADD .zshrc.mongo ${MONGO_ZSHRC_FILE}
RUN chmod +x ${MONGO_ZSHRC_FILE}
RUN echo "source ${MONGO_ZSHRC_FILE}" >> ${ZSHRC_FILE}
