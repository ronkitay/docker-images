#!/bin/sh

echo "" > .zshrc.generated


cat ${HOME}/.bindkey.settings >> .zshrc.generated
cat ${HOME}/.fzf.settings >> .zshrc.generated
cat .oh.my.zsh.settings >> .zshrc.generated

cat ${HOME}/.aliases/.common.aliases >> .zshrc.generated
cat ${HOME}/.aliases/.git.aliases >> .zshrc.generated
cat ${HOME}/.aliases/.iterm.aliases >> .zshrc.generated
cat ${HOME}/.aliases/.java.aliases >> .zshrc.generated
cat ${HOME}/.aliases/.k8s.aliases >> .zshrc.generated

echo "" >> .zshrc.generated
