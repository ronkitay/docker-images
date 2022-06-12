ARG RELEASE
FROM basic-env:${RELEASE}

RUN apt install build-essential gcc make -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s - -y

ARG RUST_ZSHRC_FILE=/root/.zshrc.rust
ADD .zshrc.rust ${RUST_ZSHRC_FILE}
RUN echo "source ${RUST_ZSHRC_FILE}" >> ${ZSHRC_FILE}
