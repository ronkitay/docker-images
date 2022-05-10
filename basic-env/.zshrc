
alias fd=fdfind
alias bat=batcat

source ${HOME}/.bindkey.settings
source ${HOME}/.fzf.settings

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="[%F] [%T]"

plugins=(jenv gradle virtualenv fzf kubectl kubectx helm)

SHARE_HISTORY=off

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ${HOME}/.common.aliases
source ${HOME}/.git.aliases
source ${HOME}/.iterm.aliases
source ${HOME}/.java.aliases
source ${HOME}/.k8s.aliases


