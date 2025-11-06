
alias fd=fdfind
alias bat=batcat

source ${HOME}/.bindkey.settings
source ${HOME}/.fzf.settings

source ${HOME}/.define.colors

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

HIST_STAMPS="[%F] [%T]"

plugins=(asdf fzf git golang gradle helm kubectl kubectx virtualenv zsh-autosuggestions terraform taskwarrior)

SHARE_HISTORY=off

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,bg=black,bold"

source ${HOME}/.bat.aliases
source ${HOME}/.cd.aliases
source ${HOME}/.common.aliases
source ${HOME}/.git.aliases
source ${HOME}/.iterm.aliases
source ${HOME}/.java.aliases

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export DISABLE_AUTO_TITLE="true"
echo -ne "\e]1;${WORKSPACE_NAME}\a"
printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n ${WORKSPACE_NAME} | base64)

eval "$(starship init zsh)"
