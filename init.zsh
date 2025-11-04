if [ ! -f ~/.zsh/.initialized ]; then
  echo "First-time setup required. Running setup script..."
  bash ~/.zsh/setup.sh
fi

source ~/.zsh/lib/helpers.zsh
source ~/.zsh/options.zsh

[ -f ~/.zsh/env/homebrew.zsh ] && source ~/.zsh/env/homebrew.zsh
[ -f ~/.zsh/env/python.zsh ] && source ~/.zsh/env/python.zsh
[ -f ~/.zsh/env/node.zsh ] && source ~/.zsh/env/node.zsh
[ -f ~/.zsh/env/development.zsh ] && source ~/.zsh/env/development.zsh
[ -f ~/.zsh/env/tools.zsh ] && source ~/.zsh/env/tools.zsh

source ~/.zsh/plugins.zsh

setopt local_options null_glob
for alias_file in ~/.zsh/aliases/*.zsh(N); do
  [ -r "$alias_file" ] && source "$alias_file"
done

# Custom functions and completions 
for function_file in ~/.zsh/functions/*.zsh(N); do
  [ -r "$function_file" ] && source "$function_file"
done

for completion_file in ~/.zsh/completions/*.zsh(N); do
  [ -r "$completion_file" ] && source "$completion_file"
done
