# Path to your oh-my-zsh installation.
export ZSH="/home/aaron/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH="${PATH}:${HOME}/.local/bin/" # Local binaries
export PATH="${PATH}:${HOME}/.yarn/bin/"  # Yarn
export DENO_INSTALL="/home/aaron/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"     # Deno

# Golang
export GOPATH="${HOME}/.local/lib/go"

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Shell editing
set -o vi

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Nix
if [ -e /home/aaron/.nix-profile/etc/profile.d/nix.sh ]; then . /home/aaron/.nix-profile/etc/profile.d/nix.sh; fi

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias g="git"
alias vim="nvim"
alias vi="vim"
alias emacs="emacs -nw -Q"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias latex="tex"
alias dirs="dirs -v"
alias ls="exa"
alias mutt="neomutt"
alias d='docker'
alias dc="docker-compose"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"
alias eip="curl ipinfo.io/ip"

# WSL
export DESKTOP=/mnt/c/Users/Aaron/Desktop
