export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jage"
ZSH_CUSTOM=~/.zsh-custom

plugins=(fingerprints autojump chruby quiet sublime)

unsetopt inc_append_history

source $ZSH/oh-my-zsh.sh
