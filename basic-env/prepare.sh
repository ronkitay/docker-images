#!/bin/sh

cat ${HOME}/.bindkey.settings > .zshrc.generated
cat ${HOME}/.fzf.settings >> .zshrc.generated
cat .oh.my.zsh.settings >> .zshrc.generated

echo "" >> .zshrc.generated
