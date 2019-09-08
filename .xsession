export LANG=en_US.UTF-8
~/bin/disable-display eDP HDMI-0
xset -r
xsetroot -solid "#262626"
urxvtd -q -f -o
conky -d
synergys -c /etc/synergy.conf
/usr/X11R6/bin/cwm
