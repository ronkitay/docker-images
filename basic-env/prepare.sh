#!/bin/sh

cat ${HOME}/.bindkey.settings > .zshrc.generated
cat ${HOME}/.fzf.settings >> .zshrc.generated
cat .oh.my.zsh.settings >> .zshrc.generated

echo "" >> .zshrc.generated

#cp /Users/ronk/.my-docker-envs/Workspace-1649318775/.p10k.zsh .p10k.zsh
# cp ${HOME}/.p10k.zsh .p10k.zsh
#cp /Users/ronk/.my-docker-envs/Workspace-1649323400/.p10k.zsh .p10k.zsh
