ARG RELEASE
ARG DOCKER_REPO
ARG ARCHITECTURE
FROM ${DOCKER_REPO}/k8s-cli:${RELEASE}-${ARCHITECTURE}
ARG TARGETPLATFORM

# Install AWS CLI v2
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        curl https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o awscliv2.zip; \
    else \
        curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip; \
    fi
    
RUN unzip awscliv2.zip
RUN cd aws && ./install
RUN rm -rf aws awscliv2.zip

# Add EKS zshrc file
ENV EKS_ZSHRC_FILE=/root/.zshrc.eks
ADD .zshrc.eks ${EKS_ZSHRC_FILE}
ADD eksupdateconfig /usr/local/bin/eksupdateconfig

RUN echo "source ${EKS_ZSHRC_FILE}" >> ${ZSHRC_FILE}
