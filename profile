# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

# disable screens turning off after a while
xset s off -dpms

# setup the three monitors
 bash ~/.pepper/screenlayout/3x_2k.sh

# run status bar (time, resources, etc...)
slstatus&

# run the compositor for session
picom -f --experimental-backends&

# set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/current.jpg

# blue light filter
redshift -t 6500:3000 -b 1.0:0.8&

# use capslock as escape, clear lock on capslock
xmodmap -e "keycode 66 = Escape"
xmodmap -e "clear lock"

# tray applications
nm-applet&
pa-applet&
blueman-applet&

# open default apps
firefox&

