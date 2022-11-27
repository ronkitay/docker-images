ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/k8s-cli:${RELEASE} AS Basic-Env-with-K8S-CLI

# Install AWS CLI v2
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
RUN unzip awscliv2.zip
RUN cd aws && ./install
RUN rm -rf aws awscliv2.zip

# Install clisso
RUN curl https://github.com/allcloud-io/clisso/releases/download/0.11.0/clisso_linux_amd64.zip -OL
RUN unzip clisso_linux_amd64.zip
RUN rm clisso_linux_amd64.zip

# Add EKS zshrc file
ENV EKS_ZSHRC_FILE=/root/.zshrc.eks
ADD .zshrc.eks ${EKS_ZSHRC_FILE}
ADD awslogin /usr/local/bin/awslogin

RUN echo "source ${EKS_ZSHRC_FILE}" >> ${ZSHRC_FILE}
