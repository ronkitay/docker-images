FROM k8s-cli:3.0.0 AS Basic-Env-with-K8S-CLI

ENV EKS_ZSHRC_FILE=/root/.zshrc.eks

ADD .zshrc.eks ${EKS_ZSHRC_FILE}
RUN chmod +x ${EKS_ZSHRC_FILE}

RUN echo "source ${EKS_ZSHRC_FILE}" >> ${ZSHRC_FILE}

RUN apk add --no-cache aws-cli
