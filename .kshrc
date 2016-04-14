# allow for the powerline icons
export LC_CTYPE=en_US.UTF-8 

# change the cli line
# export PS1='$(print -n "${PWD}\n$ ")'
export PS1='`logname`@`hostname -s`:$(print -n "${PWD##*/}/ ")\$ '

# some aliases!
alias ll='ls -laf'
alias vi='vim'
alias xl='xlock -visual TrueColor -mode random'

# Tmux aliases
alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'

# Quick shutdown
alias shutdown='sudo shutdown -p now'
alias reboot='sudo reboot'

# link the time tracker functionality
. ~/dotfiles/scripts/time_tracker.ksh
# link scratch function
. ~/dotfiles/scripts/scratch.ksh
