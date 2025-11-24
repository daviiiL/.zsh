# Linux Manual Package Installation

Since you're running on Linux (CachyOS), the setup script will skip Homebrew installation.
Here's a list of packages you need to install manually.

## Required Packages

- **starship** - Modern shell prompt theme
- **neovim** - Text editor (required for NvChad configuration)

## Recommended Development Tools

- **git** - Version control system
- **github-cli** (gh) - GitHub command-line interface
- **fzf** - Fuzzy finder for command history and file search
- **ripgrep** (rg) - Fast grep alternative with better defaults
- **fd** - Fast find alternative with simpler syntax
- **bat** - Cat clone with syntax highlighting
- **eza** - Modern ls replacement (formerly exa)
- **zoxide** - Smarter cd command that learns your habits

## Installation Commands

### For CachyOS/Arch Linux (your system)

```bash
sudo pacman -S starship neovim git github-cli fzf ripgrep fd bat eza zoxide
```

### For Ubuntu/Debian

```bash
sudo apt install neovim git fzf ripgrep fd-find bat zoxide
```

Note: For starship, gh, and eza on Ubuntu/Debian, you may need to:
- Install starship via: `curl -sS https://starship.rs/install.sh | sh`
- Install gh from: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- Install eza from: https://github.com/eza-community/eza/blob/main/INSTALL.md

### For Fedora

```bash
sudo dnf install starship neovim git gh fzf ripgrep fd-find bat eza zoxide
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
```

## Post-Installation

After installing these packages, run the setup script:

```bash
bash ~/.zsh/setup.sh
```

The script will:
1. Detect that you're on Linux
2. Skip Homebrew installation
3. Show you this package list
4. Initialize the zgenom submodule
5. Install NvChad configuration
6. Create the `.initialized` marker file
