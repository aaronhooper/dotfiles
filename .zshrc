# Path to your oh-my-zsh installation.
export ZSH="/home/aaron/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Pywal
export PATH="${PATH}:${HOME}/.local/bin/"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Yarn global binaries
export PATH="${PATH}:${HOME}/.yarn/bin/"

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Golang path
export GOPATH="${HOME}/.local/lib/go"

# Deno path
export DENO_INSTALL="/home/aaron/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias g="git"
alias vim="nvim"
alias emacs="emacs -nw -Q"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias zshconfig="nvim ~/.zshrc"
alias latex="tex"
