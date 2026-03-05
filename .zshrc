export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

setopt TRANSIENT_RPROMPT

HISTSIZE=10000000
SAVEHIST=10000000

ZSH_THEME="jage"
ZSH_CUSTOM=~/.zsh-custom

plugins=(fingerprints autojump chruby quiet sublime bun mise crystal-dev)

setopt share_history
setopt hist_ignore_all_dups

source $ZSH/oh-my-zsh.sh

HOMEBREW_NO_ENV_HINTS=1
export PATH="$HOME/.local/bin:$PATH"

# Source machine-local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
