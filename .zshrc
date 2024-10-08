# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="trapd00r"

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

# Scripts
export PATH="${PATH}:${HOME}/.scripts/"

# Editor
export VISUAL="nvim"
export EDITOR="$VISUAL"

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Aliases
alias vim="nvim"
alias vi="vim"
alias latex="tex"
alias dirs="dirs -v"
alias ls="exa"
alias d='docker'
alias dc="docker compose"
alias eip="curl ipinfo.io/ip"
alias vimconfig="${EDITOR} ~/.config/nvim/init.lua"
alias vimplugins="${EDITOR} ~/.config/nvim/lua/plugins.lua"
alias zshconfig="${EDITOR} .zshrc"
alias lg="lazygit"

# Git
alias g="git"
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
alias gr='git restore'
alias grs='git restore --staged'
alias gra='git remote add'
alias gpu='git push --set-upstream'

# Git (dotfiles)
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgs='cfg status'
alias cfgcv='cfg commit --verbose'
alias cfgca='cfg commit --amend'
alias cfga='cfg add'
alias cfgap='cfg add --patch'
alias cfgl='cfg log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias cfglp='cfg log --patch'
alias cfgf='cfg fetch'
alias cfgd='cfg diff'
alias cfgds='cfg diff --staged'
alias cfgr='cfg restore'
alias cfgrs='cfg restore --staged'
alias cfgra='cfg remote add'
alias cfgpu='cfg push --set-upstream'
