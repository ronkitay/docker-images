ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/k8s-cli:${RELEASE} AS Basic-Env-with-K8S-CLI

# Install AWS CLI v2
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o awscliv2.zip
RUN unzip awscliv2.zip
RUN cd aws && ./install
RUN rm -rf aws awscliv2.zip

# Add EKS zshrc file
ENV EKS_ZSHRC_FILE=/root/.zshrc.eks
ADD .zshrc.eks ${EKS_ZSHRC_FILE}
ADD eksupdateconfig /usr/local/bin/eksupdateconfig

RUN echo "source ${EKS_ZSHRC_FILE}" >> ${ZSHRC_FILE}
