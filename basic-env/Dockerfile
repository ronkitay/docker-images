ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION} as dot-files

RUN apt -y update && apt -y upgrade && apt install -y \
    git

RUN git clone https://github.com/ronkitay/My-Dot-Files.git

FROM debian:${DEBIAN_VERSION} as basic-env

# Install ZSH and basic tools
RUN apt -y update && apt -y upgrade && apt install -y \
    bat \
    curl \
    fd-find \
    fzf \
    git \
    perl \
    procps \
    tree \
    unzip \
    vim \
    zip \
    zsh 

RUN mkdir /root/.state/
VOLUME [ "/root/.state/" ]
RUN ln -s /root/.state/.zsh_history /root/.zsh_history

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install and Configure PowerLevel10k
ARG POWER_LEVEL_10K_INSTALL_DIR=/root/.oh-my-zsh/custom/themes/powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${POWER_LEVEL_10K_INSTALL_DIR}
RUN ${POWER_LEVEL_10K_INSTALL_DIR}/gitstatus/install
ADD .p10k.zsh /root/.p10k.zsh

# Configure .zshrc
ENV ZSHRC_FILE=/root/.zshrc
ADD .zshrc ${ZSHRC_FILE}
RUN chmod +x ${ZSHRC_FILE}

COPY --from=dot-files /My-Dot-Files/.config/.bindkey.settings /root/.bindkey.settings
COPY --from=dot-files /My-Dot-Files/.config/.fzf.settings /root/.fzf.settings

COPY --from=dot-files /My-Dot-Files/.aliases/.common.aliases /root/.common.aliases
COPY --from=dot-files /My-Dot-Files/.aliases/.git.aliases /root/.git.aliases
COPY --from=dot-files /My-Dot-Files/.aliases/.iterm.aliases /root/.iterm.aliases
COPY --from=dot-files /My-Dot-Files/.aliases/.java.aliases /root/.java.aliases
COPY --from=dot-files /My-Dot-Files/.aliases/.k8s.aliases /root/.k8s.aliases

ENTRYPOINT [ "/bin/zsh" ]
