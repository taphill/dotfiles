# Aliases

alias home="cd $HOME; clear"
alias src="source $HOME/.config/zsh/.zshrc; clear"
alias conf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias vi="nvim"
alias vs='code -r'
alias of='nvim "$(fzf)"'
alias pf='bat "$(fzf)"'
alias track="git branch -a | fzf --header 'Track Branch' | xargs git switch --track"

alias ls="exa"
alias lsa="exa --all --oneline --no-icons"
alias lst="exa --all --oneline --no-icons --tree --long --git --git-ignore --ignore-glob '.git' --no-permissions --no-user --no-filesize --no-time"

alias dkp="docker ps --format 'table {{.Names}}\\t{{.ID}}\\t{{.Image}}\\t{{.Status}}'"
alias dki="docker images"
alias dkc="docker container ls --format 'table {{.Names}}\\t{{.ID}}\\t{{.Image}}\\t{{.Status}}'"
alias dce="docker compose exec"
alias run="docker compose run --rm"
alias runp="docker compose run --rm --publish 80:8080"

alias as="zsh $HOME/bin/tmux_attach_or_create_session.sh"


# Utilities

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"

# OCaml configuration

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/taylorphillips/dev/foodmaven/browser-extension-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/taylorphillips/dev/foodmaven/browser-extension-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/taylorphillips/dev/foodmaven/browser-extension-service/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/taylorphillips/dev/foodmaven/browser-extension-service/node_modules/tabtab/.completions/sls.zsh

# opam configuration
[[ ! -r /Users/taylorphillips/.opam/opam-init/init.zsh ]] || source /Users/taylorphillips/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null



# Configs

for zsh_configs in $HOME/.config/zsh/configs/*.zsh; do
  source $zsh_configs
done


# Plugins

source $HOME/.config/zsh/plugins/enhancd/init.sh
source $HOME/.config/zsh/plugins/zsh-autopair/autopair.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
