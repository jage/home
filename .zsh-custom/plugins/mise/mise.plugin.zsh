if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
elif [[ -x /opt/homebrew/bin/mise ]]; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi
