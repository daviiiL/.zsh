if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
  config_success "tools" "Loaded direnv hook"
else
  config_warn "tools" "direnv not found. Install via: brew install direnv OR sudo pacman -S direnv"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  config_success "tools" "Loaded zoxide"
else
  config_warn "tools" "zoxide not found. Install via: brew install zoxide OR sudo pacman -S zoxide"
fi
