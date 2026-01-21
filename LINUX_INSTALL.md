# Linux Manual Package Installation

Since you're running on Linux (CachyOS), the setup script will skip Homebrew installation.
Here's a list of packages you need to install manually.

## Required Packages

- **starship** - Modern shell prompt
- **neovim** - Text editor

## Recommended Development Tools

- **git** - Version control system
- **github-cli** (gh) - GitHub command-line interface
- **fzf** - Fuzzy finder
- **ripgrep** (rg) - Fast grep alternative
- **fd** - Fast find alternative
- **bat** - Cat clone with syntax highlighting
- **eza** - Modern ls replacement
- **zoxide** - Smarter cd command
- **pyenv** - Python version manager
- **direnv** - Environment variable manager
- **nvm** - Node.js version manager

## Installation Commands

### For CachyOS/Arch Linux

```bash
sudo pacman -S starship neovim git github-cli fzf ripgrep fd bat eza zoxide pyenv direnv
```

### For Ubuntu/Debian

```bash
sudo apt install neovim git fzf ripgrep fd-find bat zoxide direnv

# Additional packages via external sources:
curl -sS https://starship.rs/install.sh | sh
# gh: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
# eza: https://github.com/eza-community/eza/blob/main/INSTALL.md
# pyenv: https://github.com/pyenv/pyenv#installation
```

### For Fedora

```bash
sudo dnf install starship neovim git gh fzf ripgrep fd-find bat eza zoxide pyenv direnv
```

### NVM Installation (All Distributions)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

## Verification

After installation, verify all tools are available:

```bash
command -v starship && echo "starship OK"
command -v nvim && echo "neovim OK"
command -v git && echo "git OK"
command -v gh && echo "github-cli OK"
command -v fzf && echo "fzf OK"
command -v rg && echo "ripgrep OK"
command -v fd && echo "fd OK"
command -v bat && echo "bat OK"
command -v eza && echo "eza OK"
command -v zoxide && echo "zoxide OK"
command -v pyenv && echo "pyenv OK"
command -v direnv && echo "direnv OK"
command -v nvm && echo "nvm OK"
```

## Post-Installation

After installing these packages, run the setup script:

```bash
bash ~/.zsh/setup.sh
```
