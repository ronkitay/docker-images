ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

# Install cUrl, Git and ZSH
RUN apk --no-cache add curl git zsh

ENV ZSHRC_FILE=/root/.zshrc
ADD .zshrc ${ZSHRC_FILE}
RUN chmod +x ${ZSHRC_FILE}

ENTRYPOINT [ "/bin/zsh" ]