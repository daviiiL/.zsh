# Plugin management with zgenom

# Load zgenom
source $HOME/.zsh/framework/zgenom/zgenom.zsh

# Auto-update zgenom
zgenom autoupdate

# Check if there's an init script
if ! zgenom saved; then
  echo "Creating zgenom init script..."

  # Load oh-my-zsh base
  zgenom oh-my-zsh

  # Oh-my-zsh plugins
  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/sudo
  zgenom oh-my-zsh plugins/starship
  zgenom oh-my-zsh plugins/command-not-found
  zgenom oh-my-zsh plugins/cp
  zgenom oh-my-zsh plugins/docker
  zgenom oh-my-zsh plugins/docker-compose
  zgenom oh-my-zsh plugins/flutter

  # External plugins
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-syntax-highlighting

  # Generate the init script from plugins above
  zgenom save
fi
