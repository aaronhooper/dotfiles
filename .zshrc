# Path to your oh-my-zsh installation.
export ZSH="/home/aaron/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
	git
	zsh-autosuggestions
	asdf
)

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
# Golang
export PATH=$PATH:/usr/local/go/bin

