# Zsh Configuration

A well-organized, modular zsh configuration with automatic setup and plugin management.

## 📁 Directory Structure

```
~/.zsh/
├── init.zsh                # Main entry point - source this from ~/.zshrc
├── setup.sh                # First-time setup script (auto-runs on first load)
├── options.zsh             # Shell options and settings
├── plugins.zsh             # Plugin management (zgenom)
├── lib/                    # Core utilities and helper functions
│   └── helpers.zsh         # Helper functions for config loading
├── env/                    # Environment variables and PATH configuration
│   ├── homebrew.zsh        # Homebrew setup
│   ├── python.zsh          # Python/pyenv configuration
│   ├── node.zsh            # Node.js/NVM configuration
│   ├── development.zsh     # Development tools (Rust, Maven, Gradle, Flutter, etc.)
│   └── tools.zsh           # Additional tools (direnv, etc.)
├── aliases/                # Command aliases
│   ├── general.zsh         # General command aliases
│   └── directories.zsh     # Directory navigation shortcuts
├── functions/              # Custom shell functions (place .zsh files here)
├── completions/            # Custom completions (place .zsh files here)
└── framework/              # zgenom plugin manager (git submodule)
```

## 🚀 Installation

### First Time Setup

1. Clone this repository to `~/.zsh`:
   ```bash
   git clone <your-repo-url> ~/.zsh
   cd ~/.zsh
   git submodule update --init --recursive
   ```

2. Add to your `~/.zshrc`:
   ```bash
   source ~/.zsh/init.zsh
   ```

3. Restart your shell or run:
   ```bash
   source ~/.zshrc
   ```

4. The first-time setup script will automatically run and install:
   - Homebrew (if not already installed)
   - Starship prompt
   - Neovim
   - Development tools (git, gh, fzf, ripgrep, fd, bat, eza, zoxide)
   - NvChad (Neovim configuration)

## 📝 Configuration

### Adding Environment Variables

Create or edit files in `env/` directory:

```bash
# Example: ~/.zsh/env/custom.zsh
export MY_VAR="value"
export PATH="$HOME/mytools:$PATH"
```

Environment files are loaded in this order:
1. `homebrew.zsh` - Homebrew initialization (loaded first for package manager)
2. `python.zsh` - Python/pyenv setup
3. `node.zsh` - Node.js/NVM setup
4. `development.zsh` - Development tools paths
5. `tools.zsh` - Additional tools

### Adding Aliases

Create or edit files in `aliases/` directory:

```bash
# Example: ~/.zsh/aliases/git.zsh
alias gs='git status'
alias gp='git push'
alias gl='git pull'
```

### Adding Custom Functions

Place function files in `functions/` directory:

```bash
# Example: ~/.zsh/functions/mkcd.zsh
mkcd() {
  mkdir -p "$1" && cd "$1"
}
```

### Adding Plugins

Edit `plugins.zsh` and add plugins using zgenom:

```bash
# Oh-my-zsh plugin
zgenom oh-my-zsh plugins/git

# External plugin
zgenom load author/plugin-name
```

After adding plugins, regenerate the init script:
```bash
zgenom reset
```

### Shell Options

Edit `options.zsh` to customize shell behavior:
- History settings
- Directory navigation options
- Completion options
- Globbing behavior

## 🔧 Helper Functions

Available helper functions (defined in `lib/helpers.zsh`):

- `config_warn "module" "message"` - Display warning
- `config_error "module" "message"` - Display error
- `config_success "module" "message"` - Display success (when ZSH_CONFIG_VERBOSE is set)
- `config_command_exists "command"` - Check if command exists
- `config_path_exists "/path"` - Check if path exists

### Verbose Mode

Enable verbose loading messages:
```bash
export ZSH_CONFIG_VERBOSE=1
```

## 📦 Installed Tools

The setup script installs these tools:

- **git** - Version control
- **gh** - GitHub CLI
- **fzf** - Fuzzy finder
- **ripgrep** - Better grep (rg)
- **fd** - Better find
- **bat** - Better cat with syntax highlighting
- **eza** - Better ls (formerly exa)
- **zoxide** - Better cd (z)
- **starship** - Modern prompt
- **neovim** - Modern Vim
- **NvChad** - Neovim configuration

## 🔄 Updating

### Update zgenom and plugins:
```bash
zgenom update
```

### Reset and regenerate plugin cache:
```bash
zgenom reset
```

### Re-run first-time setup:
```bash
rm ~/.zsh/.initialized
source ~/.zsh/init.zsh
```

## 🎨 Customization Tips

1. **Directory Shortcuts**: Edit `aliases/directories.zsh` to add custom directory hashes:
   ```bash
   hash -d myproject=$HOME/code/my-project
   # Then use: cd ~myproject
   ```

2. **Per-project Configuration**: Use `direnv` (already installed) to create project-specific environments:
   ```bash
   cd your-project
   echo "export MY_VAR=value" > .envrc
   direnv allow
   ```

3. **Custom Completions**: Place completion scripts in `completions/` directory

4. **Environment-specific Config**: Create conditional configs in env files:
   ```bash
   if [[ $(hostname) == "work-laptop" ]]; then
     export WORK_VAR="value"
   fi
   ```

## 🐛 Troubleshooting

### Plugins not loading
```bash
zgenom reset
source ~/.zshrc
```

### Slow startup
Check loading times:
```bash
time zsh -i -c exit
```

Profile with:
```bash
zsh -xv 2>&1 | less
```

### NVM not found
```bash
brew install nvm
# Or use the official installer
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

## 📄 License

This configuration is available for personal use. Modify as needed.
