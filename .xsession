export LANG=en_US.UTF-8
#~/bin/disable-display eDP HDMI-0
xsetroot -solid "#262626"
#feh --bg-scale /home/bucky/11e-bg-2560x1080.png
urxvtd -q -f -o
tint2 &
xautolock -locker slock -time 5 &
/usr/X11R6/bin/cwm
