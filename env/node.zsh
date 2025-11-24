export NVM_DIR="$HOME/.nvm"

if command -v brew >/dev/null 2>&1 && [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  config_success "node" "Loaded NVM from Homebrew (/opt/homebrew/opt/nvm)"
elif [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/nvm_completion" ] && \. "$NVM_DIR/nvm_completion"
  config_success "node" "Loaded NVM from $NVM_DIR"
else
  config_warn "node" "NVM not found. Install via: brew install nvm OR curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash"
fi
