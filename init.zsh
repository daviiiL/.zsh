# ~/.zsh/init.zsh
# Main initialization file for zsh configuration
# Load this file from ~/.zshrc with: source ~/.zsh/init.zsh

# ============================================================================
# First-time setup check
# ============================================================================
if [ ! -f ~/.zsh/.initialized ]; then
  echo "First-time setup required. Running setup script..."
  bash ~/.zsh/setup.sh
fi

# ============================================================================
# Load core utilities and helpers
# ============================================================================
source ~/.zsh/lib/helpers.zsh

# ============================================================================
# Shell options and settings
# ============================================================================
source ~/.zsh/options.zsh

# ============================================================================
# Environment configuration (must be loaded early for PATH, etc.)
# ============================================================================
# Load environment files in order of priority
[ -f ~/.zsh/env/homebrew.zsh ] && source ~/.zsh/env/homebrew.zsh
[ -f ~/.zsh/env/python.zsh ] && source ~/.zsh/env/python.zsh
[ -f ~/.zsh/env/node.zsh ] && source ~/.zsh/env/node.zsh
[ -f ~/.zsh/env/development.zsh ] && source ~/.zsh/env/development.zsh
[ -f ~/.zsh/env/tools.zsh ] && source ~/.zsh/env/tools.zsh

# ============================================================================
# Plugin management
# ============================================================================
source ~/.zsh/plugins.zsh

# ============================================================================
# Aliases
# ============================================================================
# Enable null_glob to handle empty directories gracefully
setopt local_options null_glob
for alias_file in ~/.zsh/aliases/*.zsh(N); do
  [ -r "$alias_file" ] && source "$alias_file"
done

# ============================================================================
# Custom functions
# ============================================================================
for function_file in ~/.zsh/functions/*.zsh(N); do
  [ -r "$function_file" ] && source "$function_file"
done

# ============================================================================
# Custom completions
# ============================================================================
for completion_file in ~/.zsh/completions/*.zsh(N); do
  [ -r "$completion_file" ] && source "$completion_file"
done
