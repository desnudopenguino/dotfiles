export LANG=en_US.UTF-8
xmodmap ~/.xmodmaprc
conky &
urxvtd -q -f -o
compton &
xautolock -time 5 -locker "/usr/X11R6/bin/xlock -mode image -bitmap /home/bucky/logo.xpm -count 1" &
/usr/X11R6/bin/cwm
