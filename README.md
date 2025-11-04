# Zsh Configuration

Modular zsh configuration with zgenom plugin management.

## Installation

```bash
git clone <repo-url> ~/.zsh
cd ~/.zsh
git submodule update --init --recursive
```

Add to `~/.zshrc`:
```bash
source ~/.zsh/init.zsh
```

## Structure

```
~/.zsh/
├── init.zsh         # Main entry point
├── setup.sh         # First-time setup
├── options.zsh      # Shell options
├── plugins.zsh      # Plugin management
├── lib/            # Helper functions
├── env/            # Environment variables
├── aliases/        # Command aliases
├── functions/      # Custom functions
├── completions/    # Custom completions
└── framework/      # zgenom
```

## Usage

Add files to:
- `env/` for environment variables
- `aliases/` for command aliases
- `functions/` for shell functions

Update plugins in `plugins.zsh`, then run:
```bash
zgenom reset
```
