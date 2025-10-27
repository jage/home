export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

ZSH_THEME="jage"
ZSH_CUSTOM=~/.zsh-custom

plugins=(fingerprints autojump chruby quiet sublime)

setopt share_history
setopt hist_ignore_all_dups

source $ZSH/oh-my-zsh.sh
