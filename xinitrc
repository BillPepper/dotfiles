#!/bin/zsh

# start dbus
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment DISPLAY XAUTHORITY

# disable screen turning off
xset s off -dpms

xrdb ~/.Xresources

# start default apps
slstatus&

# start dmw
/usr/local/bin/dwm
