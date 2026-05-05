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

# Cache the output of slow shell-init commands.
# Regenerates only when the binary is newer than the cache.
# Usage: _zsh_cache <name> <cmd-or-abs-path> [args...]
_zsh_cache() {
  local name=$1 cmd=$2; shift 2
  local bin
  if [[ $cmd = /* ]]; then bin=$cmd; else bin=${commands[$cmd]}; fi
  local cache=$HOME/.cache/zsh/${name}.zsh
  if [[ -x $bin ]] && [[ ! -s $cache || $bin -nt $cache ]]; then
    mkdir -p ${cache:h} && "$bin" "$@" > $cache
  fi
  [[ -s $cache ]] && source $cache
  return 0
}

# Source machine-local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
