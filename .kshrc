# allow for the powerline icons
export LANG="en_US.UTF-8"

# change the cli line
# export PS1='$(print -n "${PWD}\n$ ")'
export PS1='\u@\h:\w$ '

set -o vi

# some aliases!
alias ll='ls -laf'
alias vi='vim'
alias xl='xlock -visual TrueColor -mode random'

# Tmux aliases
alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'

# Quick shutdown
alias shutdown='sudo shutdown -p now'
alias reboot='sudo reboot'

# Quick browse usenig feh
alias fehb='feh -g 640x480 -d -S filename'

# Quick connect to box via cadaver
alias box='cadaver https://dav.box.com/dav/'

# Quick bundle install
alias binstall='bundle install --path=~/.gem'

# link the time tracker functionality
. ~/dotfiles/scripts/work_logger.ksh
# link scratch function
. ~/dotfiles/scripts/scratch.ksh
# link shortcut encription functionality
. ~/dotfiles/scripts/encrypt.ksh
# link wifi function
. ~/dotfiles/scripts/wifi.sh
