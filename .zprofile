export PATH="/Users/taylorphillips/.deno/bin:$PATH"

export EDITOR="nvim"
export KEYTIMEOUT=1

# Node
export NVM_DIR="$HOME/.nvm"

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

# Bat theme
export BAT_THEME='gruvbox-dark'

# Enhancd options
export ENHANCD_DISABLE_DOT=1

# This is needed so that neovim syntax highlighting works in tmux
export TERM="xterm-256color"
