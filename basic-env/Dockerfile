ARG DEBIAN_VERSION="bookworm"
FROM debian:${DEBIAN_VERSION}

RUN mkdir /root/.config/

# Install ZSH and basic tools
RUN apt -y update && apt -y upgrade && apt install -y \
    bat \
    bc \
    curl \
    fd-find \
    fzf \
    git \
    host \
    jq \
    perl \
    procps \
    telnet \
    tree \
    unzip \
    vim \
    zip \
    zsh

# Install tools not available via apt
RUN curl -L https://github.com/mikefarah/yq/releases/download/$(curl https://github.com/mikefarah/yq/releases/latest -v 2>&1 |  grep 'location:' |  tr -d '\n\r' | awk -F '/' '{print $NF}')/yq_linux_arm64 -o /usr/bin/yq  && chmod +x /usr/bin/yq

RUN mkdir /root/workspace/
VOLUME [ "/root/workspace/" ]

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Install Starship
RUN sh -c "curl -sS https://starship.rs/install.sh | sh -s -- -y"
ADD starship.toml /root/.config/starship.toml

# Configure .zshrc
ENV ZSHRC_FILE=/root/.zshrc
ADD .zshrc ${ZSHRC_FILE}
RUN chmod +x ${ZSHRC_FILE}

RUN git clone https://github.com/ronkitay/My-Dot-Files.git && \
    cp /My-Dot-Files/.config/.bindkey.settings /root/.bindkey.settings && \
    cp /My-Dot-Files/.config/.fzf.settings /root/.fzf.settings && \
    cp /My-Dot-Files/.config/.man.settings /root/.man.settings && \
    cp /My-Dot-Files/.aliases/.define.colors /root/.define.colors && \
    cp /My-Dot-Files/.aliases/.aws.aliases /root/.aws.aliases && \
    cp /My-Dot-Files/.aliases/.bat.aliases /root/.bat.aliases && \
    cp /My-Dot-Files/.aliases/.common.aliases /root/.common.aliases && \
    cp /My-Dot-Files/.aliases/.cd.aliases /root/.cd.aliases && \
    cp /My-Dot-Files/.aliases/.git.aliases /root/.git.aliases && \
    cp /My-Dot-Files/.aliases/.iterm.aliases /root/.iterm.aliases && \
    cp /My-Dot-Files/.aliases/.java.aliases /root/.java.aliases && \
    cp /My-Dot-Files/.aliases/.k8s.aliases /root/.k8s.aliases && \
    rm -rf /My-Dot-Files

ENTRYPOINT [ "/bin/zsh" ]

WORKDIR /root/
