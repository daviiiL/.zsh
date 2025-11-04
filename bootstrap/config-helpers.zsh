# Config loading helpers and validation utilities

# Colors for output
_CONFIG_RED='\033[0;31m'
_CONFIG_YELLOW='\033[1;33m'
_CONFIG_GREEN='\033[0;32m'
_CONFIG_NC='\033[0m' # No Color

# Warn about missing dependencies
# Usage: config_warn "module_name" "message"
config_warn() {
  local module=$1
  local message=$2
  echo -e "${_CONFIG_YELLOW}⚠ [${module}]${_CONFIG_NC} ${message}" >&2
}

# Error about missing critical dependencies
# Usage: config_error "module_name" "message"
config_error() {
  local module=$1
  local message=$2
  echo -e "${_CONFIG_RED}✗ [${module}]${_CONFIG_NC} ${message}" >&2
}

# Success message (optional, for verbose mode)
# Usage: config_success "module_name" "message"
config_success() {
  local module=$1
  local message=$2
  # Only show if ZSH_CONFIG_VERBOSE is set
  [[ -n "$ZSH_CONFIG_VERBOSE" ]] && echo -e "${_CONFIG_GREEN}✓ [${module}]${_CONFIG_NC} ${message}" >&2
}

# Check if a command exists
# Usage: if config_command_exists "command"; then ... fi
config_command_exists() {
  command -v "$1" &>/dev/null
}

# Check if a file/directory exists
# Usage: if config_path_exists "/path/to/file"; then ... fi
config_path_exists() {
  [[ -e "$1" ]]
}
