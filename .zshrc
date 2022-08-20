# Path to your oh-my-zsh installation.
export ZSH="/home/aaron/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Local binaries
export PATH="${PATH}:${HOME}/.local/bin/"

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Shell editing
set -o vi

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias g="git"
alias vim="nvim"
alias latex="tex"
alias dirs="dirs -v"
alias ls="exa"
alias d='docker'
alias dc="docker-compose"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"
alias eip="curl ipinfo.io/ip"

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Golang
export PATH=$PATH:/usr/local/go/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
