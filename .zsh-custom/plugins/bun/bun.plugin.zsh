if [[ -d "$HOME/.bun" ]]; then
  [[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi
