FROM basic-env:3.0.0

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN su -l root; su -; install -o root -g root -m 0755 /kubectl /usr/local/bin/kubectl
RUN rm /kubectl

# Install Kubectx
RUN cp /etc/apt/sources.list /etc/apt/sources.list.${DEBIAN_VERSION}
RUN echo "deb [trusted=yes] http://ftp.de.debian.org/debian buster main" > /etc/apt/sources.list 
RUN apt -y update && apt install -y kubectx
RUN mv /etc/apt/sources.list.${DEBIAN_VERSION} /etc/apt/sources.list

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN rm get_helm.sh

# Add K8S zshrc file
ARG K8S_ZSHRC_FILE=/root/.zshrc.k8s
ADD .zshrc.k8s ${K8S_ZSHRC_FILE}
RUN chmod +x ${K8S_ZSHRC_FILE}
RUN echo "source ${K8S_ZSHRC_FILE}" >> ${ZSHRC_FILE}
