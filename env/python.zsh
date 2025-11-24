export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
elif [[ -x /opt/homebrew/bin/pyenv ]]; then
  eval "$(/opt/homebrew/bin/pyenv init - zsh)"
elif [[ -x /usr/local/bin/pyenv ]]; then
  eval "$(/usr/local/bin/pyenv init - zsh)"
fi
