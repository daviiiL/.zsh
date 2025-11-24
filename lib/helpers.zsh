_CONFIG_RED='\033[0;31m'
_CONFIG_YELLOW='\033[1;33m'
_CONFIG_GREEN='\033[0;32m'
_CONFIG_NC='\033[0m'

config_warn() {
  local module=$1
  local message=$2
  echo -e "${_CONFIG_YELLOW}⚠ [${module}]${_CONFIG_NC} ${message}" >&2
}

config_error() {
  local module=$1
  local message=$2
  echo -e "${_CONFIG_RED}✗ [${module}]${_CONFIG_NC} ${message}" >&2
}

config_success() {
  local module=$1
  local message=$2
  [[ -n "$ZSH_CONFIG_VERBOSE" ]] && echo -e "${_CONFIG_GREEN}✓ [${module}]${_CONFIG_NC} ${message}" >&2
}

config_command_exists() {
  command -v "$1" &>/dev/null
}

config_path_exists() {
  [[ -e "$1" ]]
}

is_macos() {
  [[ "$OSTYPE" == darwin* ]]
}

is_linux() {
  [[ "$OSTYPE" == linux* ]]
}

is_arch() {
  [[ -f /etc/arch-release ]] || [[ -f /etc/cachyos-release ]] || command -v pacman &>/dev/null
}

is_debian() {
  [[ -f /etc/debian_version ]] || command -v apt &>/dev/null
}

is_fedora() {
  [[ -f /etc/fedora-release ]] || command -v dnf &>/dev/null
}
