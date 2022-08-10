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

#disable monitor energy safe
xset dpms 0 0 0

# setup the three monitors
bash ~/.screenlayout/3x_2k.sh

# run status bar (time, resources, etc...)
slstatus&

# run the compositor for session
picom -f --experimental-backends&

# set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/current.jpg

# open default apps
firefox&
pulseeffects&
