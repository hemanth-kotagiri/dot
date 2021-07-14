# Use powerline
USE_POWERLINE="true"

# Editor
export EDITOR=nvim

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

NEWLINE=$'\n'

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%2~%{$fg[red]%}]%{$reset_color%}${NEWLINE}$%b "

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


export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Plugins
plugins=(git vi-mode)

# Vi-Mode
bindkey -v
# ALIAS
alias r=". ranger"
alias wo="cd /media/data/Workspace"
alias o="cd Documents/obsidian"
alias ls="lsd --group-dirs first"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias v="nvim"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Autocomplete
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

autoload -Uz promptinit
promptinit

neofetch
