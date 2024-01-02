[[ $- != *i* ]] && return
fpath=($HOME/completion_zsh $fpath)

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias qutebrowser='screen -dmS qutebrowser_session bash -c "qutebrowser >/dev/null 2>&1"'
alias spotify='ncspot'
alias vim='nvim'

# Global variables
export EDITOR='nvim'
export PF_INFO='ascii title os kernel wm editor shell uptime pkgs memory'
export PF_COL1=""
export PF_COL2=""
export PF_COL3=""
export RAVEDUDE_PORT=/dev/ttyUSB0

# auto completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vim mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

pfetch

PS1=' %1~ >-> '
. "$HOME/.cargo/env"

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# pnpm
export PNPM_HOME="/home/lobotomized-dev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
