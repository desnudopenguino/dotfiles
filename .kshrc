# allow for the powerline icons
export LANG="en_US.UTF-8"

# change the cli line
# export PS1='$(print -n "${PWD}\n$ ")'
export PS1="\033[1;31m\u\033[1;37m@\033[1;33m\h\033[1;37m:\033[1;34m\w\033[0m\n\033[1;37m$\033[0m "

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
alias shutdown='doas shutdown -p now'
alias reboot='doas reboot'

# Quick browse usenig feh
alias fehb='feh -g 640x480 -d -S filename'

# Quick connect to box via cadaver
alias box='cadaver https://dav.box.com/dav/'

# Quick bundle install
alias binstall='bundle install --path=~/.gem'

# Weather!
alias wttr='curl -s wttr.in/Spokane | head -7'
alias wttrall='curl -s wttr.in/Spokane'

# My external IP
alias myip="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

# load hidden (torified, proxied, i2p) qutebrowser  
alias hidden-qute="qutebrowser --basedir /home/bucky/.hidden-qute"

# connect to home vpn
alias homevpn="doas openvpn --config .openvpn --cipher AES-256-CBC --daemon openvpn"

# link scratch function
#. ~/dotfiles/scripts/scratch.ksh
# link shortcut encription functionality
#. ~/dotfiles/scripts/encrypt.ksh
