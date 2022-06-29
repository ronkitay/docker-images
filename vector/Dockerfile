ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Vector
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.vector.dev | zsh -s -- -y

# Add Vector zshrc file
ARG VECTOR_ZSHRC_FILE=/root/.zshrc.vector
ADD .zshrc.vector ${VECTOR_ZSHRC_FILE}
RUN chmod +x ${VECTOR_ZSHRC_FILE}
RUN echo "source ${VECTOR_ZSHRC_FILE}" >> ${ZSHRC_FILE}
