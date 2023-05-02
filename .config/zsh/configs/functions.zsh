function edit() {
  case "$1" in
    (v)
      $EDITOR ~/.config/nvim/init.lua
      ;;
    (z)
      $EDITOR ~/.config/zsh/.zshrc
      ;;
    (a)
      $EDITOR ~/.config/alacritty/alacritty.yml
      ;;
    (s)
      $EDITOR ~/.config/starship/config.toml
      ;;
    (t)
      $EDITOR ~/.config/tmux/tmux.conf
      ;;
    (g)
      $EDITOR ~/.gitconfig
      ;;
    (c)
      $EDITOR ~/.aws/credentials
      ;;
  esac
}

function mcd() {
  mkdir -p "$1" && cd "$1";
}

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;
        viins|main) echo -ne '\e[6 q';;
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q'
preexec() { echo -ne '\e[6 q' ;}
