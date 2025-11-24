if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  config_success "homebrew" "Loaded Homebrew from /opt/homebrew (Apple Silicon)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
  config_success "homebrew" "Loaded Homebrew from /usr/local (Intel)"
else
  config_warn "homebrew" "Homebrew not found. This is expected on Linux systems."
fi
