export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

ZSH_THEME="jage"
ZSH_CUSTOM=~/.zsh-custom

plugins=(fingerprints autojump chruby quiet sublime)

unsetopt inc_append_history

source $ZSH/oh-my-zsh.sh
