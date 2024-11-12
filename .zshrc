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
# Inspiration: https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Enable auto complete for programs like git
autoload -U compinit
compinit

# Ensure emacs keybinding when in tmux
# blog post: https://matija.suklje.name/zsh-vi-and-emacs-modes
bindkey -e

# Base path
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Git branch to display in prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Enable colored terminal
export CLICOLOR="1"

# Color terminal prompt
export PROMPT='%10F%n%9F@%10F%m%f: %4F%~%9F$(parse_git_branch)%f \$ '

# Set default editor
export EDITOR="vim"

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
