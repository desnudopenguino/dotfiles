# allow for the powerline icons
export LC_CTYPE=en_US.UTF-8 

# change the cli line
export PS1='$(print -n "${PWD}\n$ ")'

# some aliases!
alias ll='ls -laf'
alias vi='vim'
alias xlock='xlock -visual TrueColor -mode random'

# Tmux aliases
alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'

# link the time tracker functionality
. ~/dotfiles/scripts/time_tracker.ksh
