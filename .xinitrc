if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi

# Start bspwm windows manager
# exec dwm
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session
