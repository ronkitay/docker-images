FROM docker-basic-env:1.0.1

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN su -l root; su -; install -o root -g root -m 0755 /kubectl /usr/local/bin/kubectl
RUN rm /kubectl

ENV K8S_ZSHRC_FILE=/root/.zshrc.k8s

ADD .zshrc.k8s ${K8S_ZSHRC_FILE}
RUN chmod +x ${K8S_ZSHRC_FILE}

RUN echo "source ${K8S_ZSHRC_FILE}" >> ${ZSHRC_FILE}