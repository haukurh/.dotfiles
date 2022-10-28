# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Base path
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Git branch to display in prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

COLOR_RED='\[\033[0;91m\]'
COLOR_GREEN='\[\033[0;92m\]'
COLOR_BLUE='\[\033[0;34m\]'
COLOR_RESET='\[\033[00m\]'
PROMPT_TITLE='\[\e]0;\u@\h: \w\a\]'

if [ "$color_prompt" = yes ]; then
	PS1="${PROMPT_TITLE}${COLOR_GREEN}\u${COLOR_RED}@${COLOR_GREEN}\h${COLOR_RESET}: ${COLOR_BLUE}\w${COLOR_RED}\$(parse_git_branch)${COLOR_RESET} \$ "
else
	PS1="${PROMPT_TITLE}\u@\h:\w\$(parse_git_branch) \$ "
fi
unset color_prompt

# Set default editor
export EDITOR="vim"

# basic aliases
if [ -f ~/.dotfiles/aliases ]; then
	. ~/.dotfiles/aliases
fi

# custom aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Custom settings
if [ -f ~/.bashrc.mine ]; then
	. ~/.bashrc.mine
fi

# bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
