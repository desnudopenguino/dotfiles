export LANG=en_US.UTF-8
~/bin/disable-display eDP HDMI-0
xset -r
compton -b
urxvtd -q -f -o
conky -d
synergys -c /etc/synergy.conf
feh --bg-tile ~/.bg.png
/usr/X11R6/bin/cwm
