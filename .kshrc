# allow for the powerline icons
export LANG="en_US.UTF-8"

export WWW_HOME=https://ddg.co

# change the cli line
# export PS1='$(print -n "${PWD}\n$ ")'
export PS1="\033[1;37m\u@\h:\w\n$\033[0m "

set -o vi

# some aliases!
alias ll='ls -laf'
alias vi='vim'
alias e='vim'

# Tmux aliases
alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'

# Quick shutdown
alias shutdown='doas halt -p'
alias die='doas halt -p'
alias reboot='doas reboot'

# simpler pkg mgmt
alias pkg_add='doas pkg_add'
alias pkg_delete='doas pkg_delete'
alias syspatch='doas syspatch'

# Quick browse usenig feh
alias fehb='feh -g 640x480 -d -S filename'

# Quick connect to box via cadaver
alias box='cadaver https://dav.box.com/dav/'

# Weather!
alias wttr='curl -s wttr.in/Spokane | head -7'
alias allwttr='curl -s wttr.in/Spokane'

# My external IP
alias myip="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

# run last command with doas
alias fuck='doas $(fc -ln -1)'
alias pls='doas $(fc -ln -1)'

# alias for ifconfig
alias ifconfig='doas ifconfig'

# alias for my workout sheets
alias workout='cd ~/.scratch&&vim note:workout'

# alias vim fzf
alias fzv='vim $(fzf)'
