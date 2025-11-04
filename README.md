# daviiiL's ZSH config primarily for my macs

> will started to integrate my linux zsh dotfile with this one as well... darwin systems for now

## basic stuff

```sh
# Put it wherever you like
zsh_config_dir="$HOME/.zsh"

# Clone the config into that directory
git clone https://github.com/daviiiL/.zsh "$zsh_config_dir"

# Source the config
echo "source \"$zsh_config_dir/init.zsh\"" >> "$HOME/.zshrc"

# Optionally make sure the setup script is executable
# chmod +x "$zsh_config_dir/setup.sh"

# Reload your zsh configuration
source "$HOME/.zshrc"
```
