source $HOME/.zsh/framework/zgenom/zgenom.zsh

zgenom autoupdate

if ! zgenom saved; then
  echo "Creating zgenom init script..."

  zgenom oh-my-zsh

  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/sudo
  zgenom oh-my-zsh plugins/starship
  zgenom oh-my-zsh plugins/colored-man-pages

  zgenom oh-my-zsh plugins/command-not-found
  zgenom oh-my-zsh plugins/cp
  zgenom oh-my-zsh plugins/fzf
  zgenom oh-my-zsh plugins/gh 
  zgenom oh-my-zsh plugins/thefuck
  zgenom oh-my-zsh plugins/docker
  zgenom oh-my-zsh plugins/docker-compose
  zgenom oh-my-zsh plugins/flutter

  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-syntax-highlighting

  zgenom save
fi
