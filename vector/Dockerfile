FROM basic-env:3.0.0

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.vector.dev | zsh -s -- -y

ENV VECTOR_ZSHRC_FILE=/root/.zshrc.vector

ADD .zshrc.vector ${VECTOR_ZSHRC_FILE}
RUN chmod +x ${VECTOR_ZSHRC_FILE}

RUN echo "source ${VECTOR_ZSHRC_FILE}" >> ${ZSHRC_FILE}
