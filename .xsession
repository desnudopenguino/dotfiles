export LANG=en_US.UTF-8
xmodmap ~/.xmodmaprc
conky &
cd ~/dotfiles/scripts && ./random_wallpaper.ksh &
compton &
/usr/X11R6/bin/cwm
