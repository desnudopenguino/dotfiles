# change the cli line
export PS1='$(print -n "${PWD}\n$ ")'

# some aliases!
alias ll='ls -laf'
alias vi='vim'
alias xlock='xlock -visual TrueColor -mode random'
alias tml='tmux ls'
alias tma='tmux a -t'

# link the time tracker functionality
. ~/dotfiles/scripts/time_tracker.ksh
