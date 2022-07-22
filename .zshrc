# zshrc

# Show hidden files on tab complete
setopt globdots

# Disable auto complete menu
unsetopt automenu

# Enable variables in prompt
setopt prompt_subst

# Disable beep on error
unsetopt BEEP

# Disable auto remove slash
setopt no_auto_remove_slash

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=10000

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
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Set default editor
export EDITOR="vim"

# macOS aliases
alias ls="ls -G"
alias ll="ls -lhaG"

# Basic aliases
if [ -f ~/.dotfiles/aliases ]; then
	. ~/.dotfiles/aliases
fi

# Custom aliases
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# Custom settings
if [ -f ~/.zshrc.mine ]; then
	. ~/.zshrc.mine
fi

autoload -U +X bashcompinit && bashcompinit

