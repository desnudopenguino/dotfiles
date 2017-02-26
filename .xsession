export LANG=en_US.UTF-8
xmodmap ~/.xmodmaprc
conky &
urxvtd -q -f -o
cd ~/dotfiles/scripts && ./random_wallpaper.ksh &
/usr/X11R6/bin/cwm
