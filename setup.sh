#!/usr/bin/env bash

# First-time setup script for .zsh configuration
# This script installs all required dependencies for the zsh configuration

set -e  # Exit on error

ZSH_DIR="$HOME/.zsh"
INITIALIZED_FILE="$ZSH_DIR/.initialized"

echo "=========================================="
echo "  .zsh Configuration - First Time Setup  "
echo "=========================================="
echo ""

# Detect OS
OS_TYPE="$(uname -s)"
IS_MACOS=false
IS_LINUX=false

case "$OS_TYPE" in
  Darwin*)
    IS_MACOS=true
    echo "Detected macOS system"
    ;;
  Linux*)
    IS_LINUX=true
    echo "Detected Linux system"
    ;;
  *)
    echo "Warning: Unknown operating system: $OS_TYPE"
    ;;
esac

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install packages based on OS
if [ "$IS_MACOS" = true ]; then
  # Install Homebrew if not already installed
  if ! command_exists brew; then
    echo "Installing Homebrew package manager..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
      echo "Configuring Homebrew PATH for Apple Silicon..."
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  else
    echo "Homebrew is already installed"
  fi

  # Update Homebrew
  echo "Updating Homebrew..."
  brew update

  # Install Starship prompt
  if ! command_exists starship; then
    echo "Installing Starship prompt..."
    brew install starship
  else
    echo "Starship is already installed"
  fi

  # Install Neovim (required for NvChad)
  if ! command_exists nvim; then
    echo "Installing Neovim..."
    brew install neovim
  else
    echo "Neovim is already installed"
  fi

  # Install other useful tools
  echo "Installing additional development tools..."
  TOOLS=(
    "git"          # Version control
    "gh"           # GitHub CLI
    "fzf"          # Fuzzy finder
    "ripgrep"      # Better grep
    "fd"           # Better find
    "bat"          # Better cat
    "eza"          # Better ls (formerly exa)
    "zoxide"       # Better cd
    "pyenv"        # Python version manager
    "direnv"       # Environment variable manager
  )

  for tool in "${TOOLS[@]}"; do
    if ! command_exists "$tool"; then
      echo "  Installing $tool..."
      brew install "$tool"
    else
      echo "  $tool is already installed"
    fi
  done

elif [ "$IS_LINUX" = true ]; then
  echo ""
  echo "=========================================="
  echo "  Linux System Detected                  "
  echo "=========================================="
  echo ""

  # Detect Linux distribution
  IS_ARCH=false

  if [ -f /etc/arch-release ] || [ -f /etc/cachyos-release ] || command_exists pacman; then
    IS_ARCH=true
    echo "Detected Arch-based Linux distribution"
  fi

  if [ "$IS_ARCH" = true ]; then
    # Arch Linux automatic installation
    echo ""
    echo "=========================================="
    echo "  Arch Linux Package Installation        "
    echo "=========================================="
    echo ""

    # Check if pacman is available
    if ! command_exists pacman; then
      echo "Error: pacman not found. Cannot proceed with automatic installation."
      exit 1
    fi

    # Define packages to install
    PACKAGES=(
      "starship"
      "neovim"
      "git"
      "github-cli"
      "fzf"
      "ripgrep"
      "fd"
      "bat"
      "eza"
      "zoxide"
      "pyenv"
      "direnv"
    )

    # Check which packages are already installed
    PACKAGES_TO_INSTALL=()
    echo "Checking installed packages..."
    for pkg in "${PACKAGES[@]}"; do
      if ! pacman -Qi "$pkg" >/dev/null 2>&1; then
        PACKAGES_TO_INSTALL+=("$pkg")
      else
        echo "  ✓ $pkg is already installed"
      fi
    done

    # Install missing packages
    if [ ${#PACKAGES_TO_INSTALL[@]} -gt 0 ]; then
      echo ""
      echo "The following packages will be installed:"
      for pkg in "${PACKAGES_TO_INSTALL[@]}"; do
        echo "  - $pkg"
      done
      echo ""

      read -p "Do you want to proceed with installation? (y/N) " -n 1 -r
      echo ""

      if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing packages with pacman (this may require sudo)..."
        sudo pacman -S --needed "${PACKAGES_TO_INSTALL[@]}"

        if [ $? -eq 0 ]; then
          echo "✓ Packages installed successfully"
        else
          echo "⨯ Package installation failed. Please check the error messages above."
          exit 1
        fi
      else
        echo "Installation cancelled by user."
        echo "Please install the required packages manually before continuing."
        exit 1
      fi
    else
      echo ""
      echo "✓ All required packages are already installed"
    fi

    # Check for paru (AUR helper)
    if command_exists paru; then
      echo ""
      echo "✓ paru (AUR helper) is available for additional packages"
    else
      echo ""
      echo "Note: paru (AUR helper) is not installed."
      echo "Most packages are available in official repositories, but you may want to install paru for AUR packages."
      echo "Visit: https://github.com/Morganamilo/paru"
    fi

  else
    # Other Linux distributions - informational message only
    echo ""
    echo "=========================================="
    echo "  Automatic Setup Not Available          "
    echo "=========================================="
    echo ""
    echo "Automatic package installation is currently only supported for Arch-based distributions."
    echo ""
    echo "Please install the following packages manually using your system's package manager,"
    echo "then re-run this script or continue with the setup."
    echo ""
    echo "Required packages:"
    echo "  - starship      (prompt theme)"
    echo "  - neovim        (text editor, required for NvChad)"
    echo ""
    echo "Recommended development tools:"
    echo "  - git           (version control)"
    echo "  - github-cli    (gh - GitHub CLI)"
    echo "  - fzf           (fuzzy finder)"
    echo "  - ripgrep       (better grep)"
    echo "  - fd            (better find)"
    echo "  - bat           (better cat with syntax highlighting)"
    echo "  - eza           (better ls, formerly exa)"
    echo "  - zoxide        (smarter cd command)"
    echo "  - pyenv         (Python version manager)"
    echo "  - direnv        (environment variable manager)"
    echo ""
    echo "Installation commands for common distributions:"
    echo ""
    echo "For Ubuntu/Debian (apt):"
    echo "  sudo apt update"
    echo "  sudo apt install neovim git fzf ripgrep fd-find bat zoxide"
    echo "  # Note: For starship, gh, and eza, you may need to add additional repositories or use snap/cargo"
    echo ""
    echo "For Fedora (dnf):"
    echo "  sudo dnf install starship neovim git gh fzf ripgrep fd-find bat eza zoxide"
    echo ""
    echo "=========================================="
    echo ""
    read -p "Press Enter to continue after installing the packages..."
  fi

  # Install NVM for Linux
  if ! command_exists nvm; then
    echo ""
    echo "=========================================="
    echo "  Installing NVM (Node Version Manager)  "
    echo "=========================================="
    echo ""
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    if [ $? -eq 0 ]; then
      echo "✓ NVM installed successfully"
      echo "Note: You may need to restart your shell for NVM to be available"
    else
      echo "⨯ NVM installation failed. Please check the error messages above."
    fi
  else
    echo ""
    echo "✓ NVM is already installed"
  fi
fi

# Install NvChad
NVCHAD_DIR="$HOME/.config/nvim"
if [ ! -d "$NVCHAD_DIR" ]; then
  echo "Installing NvChad configuration..."
  git clone https://github.com/NvChad/starter "$NVCHAD_DIR"
else
  echo "NvChad is already installed"
fi

# Initialize zgenom submodule if not already done
if [ ! -f "$ZSH_DIR/framework/zgenom/zgenom.zsh" ]; then
  echo "Initializing zgenom submodule..."
  cd "$ZSH_DIR"
  git submodule update --init --recursive --remote

  # Ensure submodule is on the main branch, not detached HEAD
  cd "$ZSH_DIR/framework/zgenom"
  git checkout main
  cd "$ZSH_DIR"
fi

echo ""
echo "=========================================="
echo "  Setup completed successfully           "
echo "=========================================="
echo ""
echo "Creating initialization marker..."

# Create the .initialized file
cat > "$INITIALIZED_FILE" << EOF
### NOTE: THIS FILE IS AUTO-GENERATED BY setup.sh FOR THE PURPOSE OF TRACKING
### FIRST-TIME SETUP COMPLETION. DO NOT EDIT OR DELETE THIS FILE MANUALLY.
###
### If you want to re-run the setup process, simply delete this file and
### restart your shell or source init.zsh again.
###
### Setup completed on: $(date)
EOF

echo ""
echo "Setup process finished. Please restart your shell or run: source ~/.zsh/init.zsh"
echo ""
