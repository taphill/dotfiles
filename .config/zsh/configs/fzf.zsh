# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Defaults
# ---------------
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git" --glob "!node_modules"'
export FZF_DEFAULT_OPTS="
--layout=reverse
--height=20%
--color=light
--color='fg+:#ffffff,bg+:#334455,hl+:#B8E466,hl+:#B8E466'
--prompt='∼ '
--pointer='➜ '
--marker='✓ '
"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
