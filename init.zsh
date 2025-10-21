for config_file in ~/.zsh/config/**/*.zsh; do
  [ -r "$config_file" ] && source "$config_file"
done

source $HOME/.zsh/framework/zgenom/zgenom.zsh

zgenom autoupdate

if ! zgenom saved; then 

  zgenom oh-my-zsh 
  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/sudo
  zgenom oh-my-zsh plugins/command-not-found

  zgenom saved
fi

