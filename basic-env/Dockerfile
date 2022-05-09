ARG DEBIAN_VERSION
FROM debian:${DEBIAN_VERSION}

# Install ZSH and basic tools
RUN apt -y update && apt -y upgrade
RUN apt install -y procps curl zip unzip vim perl
RUN apt install -y git zsh fzf bat fd-find tree

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install and Configure PowerLevel10k
ARG POWER_LEVEL_10K_INSTALL_DIR=/root/.oh-my-zsh/custom/themes/powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${POWER_LEVEL_10K_INSTALL_DIR}
RUN ${POWER_LEVEL_10K_INSTALL_DIR}/gitstatus/install
ADD .p10k.zsh /root/.p10k.zsh

RUN ln -s /root/.state/.zsh_history /root/.zsh_history

ENV ZSHRC_FILE=/root/.zshrc
ADD .zshrc.generated ${ZSHRC_FILE}
RUN chmod +x ${ZSHRC_FILE}

ENTRYPOINT [ "/bin/zsh" ]
