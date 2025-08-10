ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}
ARG TARGETPLATFORM

# Install kubectl
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        curl -L "https://dl.k8s.io/release/v1.26.15/bin/linux/arm64/kubectl" -o /tmp/kubectl; \
    else \
        curl -L "https://dl.k8s.io/release/v1.26.15/bin/linux/amd64/kubectl" -o /tmp/kubectl; \
    fi
RUN su -l root; su -; install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
RUN rm /tmp/kubectl

# Install Kubectx
RUN apt -y update && apt install -y kubectx
    
RUN cd "$(mktemp -d)" && OS="$(uname | tr '[:upper:]' '[:lower:]')" && ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && KREW="krew-${OS}_${ARCH}" && curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && tar zxvf "${KREW}.tar.gz" && ./"${KREW}" install krew 

RUN PATH="/root/.krew/bin:$PATH" /usr/local/bin/kubectl krew install stern

# Install K9S
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        curl -L "https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_Linux_arm64.tar.gz" -o /tmp/k9s.tar.gz; \
    else \
        curl -L "https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_Linux_amd64.tar.gz" -o /tmp/k9s.tar.gz; \
    fi

RUN mkdir /k9s && cd /k9s && tar zxvf /tmp/k9s.tar.gz

# Install Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Add K8S zshrc file
ARG K8S_ZSHRC_FILE=/root/.zshrc.k8s
ADD .zshrc.k8s ${K8S_ZSHRC_FILE}
RUN echo "source ${K8S_ZSHRC_FILE}" >> ${ZSHRC_FILE}
