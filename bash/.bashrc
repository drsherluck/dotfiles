#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

git_branch() {
	git branch 2>/dev/null | grep '^*' | colrm 1 2 | stylize
}

stylize () {
	read branch
	if [[ -n "$branch" ]]; then
		echo -e " \e[92m($branch)\e[0m"
	fi
}

set_prompt() {
	local reset='\[\e[0m\]'
	local bold='\[\e[1m\]'
	local cyan='\[\e[36;1m\]'
	local white='\[\e[37m\]'

	prompt=""

	PS1="${bold}\u:${cyan}\W${reset}${bold}\$(git_branch) ${prompt} ${reset}"
}

# Set docker host
export DOCKER_HOST=tcp://127.0.0.1:2375
export MINIKUBE_IN_STYLE=false

set_prompt

set -o vi

#cd ~


#-------------------------------------------------------------------------------- 
#	Aliases
#-------------------------------------------------------------------------------- 

# Common bash commands
alias ls="ls -F --color=auto --group-directories-first"
alias la="ls -Fa"
alias ll="ls -lFh"
alias topu="top  U $USER"
alias cl="clear"
alias py="python"

# Quick access to edit configs
alias i3conf="vim ~/.config/i3/config"
alias rxvtconf="vim ~/.Xresources.d/rxvt-unicode"
alias brc="vim ~/.bashrc"
alias godir="cd ~/go/src/github.com/drsherluck"

# Git
alias glog="git log --color --pretty=format:'%Cred%h%Creset - %d %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias greset="git reset --hard && git clean -fd"
alias glo="git log --oneline"

# General
alias update="sudo pacman -Suy"

# neovim
alias vim="nvim"
alias retab='vim -s <(echo -e "gg=G\n:retab\nZZ")'

# kubectl
alias k="kubectl"
. "$HOME/.cargo/env"
