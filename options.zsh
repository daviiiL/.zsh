# Zsh options and settings

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# History options
setopt HIST_IGNORE_ALL_DUPS  # Remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from history items
setopt INC_APPEND_HISTORY    # Save history entries as soon as they are entered
setopt SHARE_HISTORY         # Share history between all sessions

# Directory navigation
setopt AUTO_CD               # Change directory by typing directory name
setopt AUTO_PUSHD           # Push the current directory onto the stack
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd

# Completion options
setopt ALWAYS_TO_END        # Move cursor to end of word after completion
setopt AUTO_MENU            # Show completion menu on successive tab press
setopt COMPLETE_IN_WORD     # Complete from both ends of a word
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu

# Other useful options
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt EXTENDED_GLOB        # Use extended globbing syntax
