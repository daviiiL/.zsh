# Load bootstrap files first (helpers, utilities)
for bootstrap_file in ~/.zsh/bootstrap/*.zsh; do
  [ -r "$bootstrap_file" ] && source "$bootstrap_file"
done

# Load main config files
for config_file in ~/.zsh/config/**/*.zsh; do
  [ -r "$config_file" ] && source "$config_file"
done


source $HOME/.zsh/framework/zgenom/zgenom.zsh

zgenom autoupdate

if ! zgenom saved; then 

  zgenom oh-my-zsh 
  
  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/sudo
  zgenom oh-my-zsh plugins/starship
  zgenom oh-my-zsh plugins/command-not-found
  zgenom oh-my-zsh plugins/cp
  zgenom oh-my-zsh plugins/docker
  zgenom oh-my-zsh plugins/docker-compose
  zgenom oh-my-zsh plugins/flutter

  zgenom saved
fi

# Load plugins
for plugin_file in ~/.zsh/plugins/*.zsh; do
  [ -r "$plugin_file" ] && source "$plugin_file"
done

# Load post-init files last (commands, overrides)
for finalize_file in ~/.zsh/post-init/*.zsh; do
  [ -r "$finalize_file" ] && source "$finalize_file"
done
