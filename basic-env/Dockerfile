ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

# Install cUrl, Git and ZSH
RUN apk --no-cache add curl git zsh fzf bat fd perl
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN /root/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus/install

ADD .p10k.zsh /root/.p10k.zsh

RUN ln -s /root/.state/.zsh_history /root/.zsh_history

ENV ZSHRC_FILE=/root/.zshrc
ADD .zshrc.generated ${ZSHRC_FILE}
RUN chmod +x ${ZSHRC_FILE}

ENTRYPOINT [ "/bin/zsh" ]