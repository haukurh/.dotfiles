# zshrc

# Show hidden files on tab complete
setopt globdots

# Disable auto complete menu
unsetopt automenu

# Enable variables in prompt
setopt prompt_subst

# Enable auto complete for programs like git
autoload -U compinit
compinit

# Git branch to display in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Color terminal
PROMPT='%10F%n%9F@%10F%m%f: %4F%~%9F$(parse_git_branch)%f \$ '

# Custom path
export PATH=~/bin:~/.npm-global/bin:/opt/puppetlabs/bin:$PATH

# Basic aliases
if [ -f ~/.dotfiles/aliases ]; then
	. ~/.dotfiles/aliases
fi

# Custom aliases
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi
