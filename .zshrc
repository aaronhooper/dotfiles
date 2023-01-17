# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

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
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
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

# Git
alias gs='git status'
alias gcv='git commit --verbose'
alias gca='git commit --amend'
alias ga='git add'
alias gap='git add --patch'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias glp='git log --patch'
alias gf='git fetch'
alias gd='git diff'
alias gds='git diff --staged'

# pnpm
export PNPM_HOME="/home/aaron/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

