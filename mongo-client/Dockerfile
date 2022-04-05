FROM basic-env:2.0.0

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' > /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories
RUN apk update && apk add mongodb

ENV MONGO_ZSHRC_FILE=/root/.zshrc.mongo

ADD .zshrc.mongo ${MONGO_ZSHRC_FILE}
RUN chmod +x ${MONGO_ZSHRC_FILE}

RUN echo "source ${MONGO_ZSHRC_FILE}" >> ${ZSHRC_FILE}