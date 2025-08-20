# PATH exports
export PATH="/Users/taylorphillips/.local/bin:$PATH"  # Python package management (uv)
export PATH="/Users/taylorphillips/.deno/bin:$PATH"   # Deno runtime
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"  # PostgreSQL tools

# Editor and shell settings
export EDITOR="nvim"
export KEYTIMEOUT=1
export TERM="xterm-256color"  # Needed for neovim syntax highlighting in tmux

# Node
export NVM_DIR="$HOME/.nvm"

# PostgreSQL development setup (optional - uncomment if needed for compiling)
# For compilers to find postgresql@16 you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
# For pkg-config to find postgresql@16 you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"

# AWS
export AWS_PROFILE="acg"
export SAM_CLI_TELEMETRY=0

# Directories
export ZDOTDIR="$HOME/.config/zsh"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Plugin options
export ENHANCD_DISABLE_DOT=1
