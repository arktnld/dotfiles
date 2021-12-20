# Load config
foreach file (
  exports.zsh
  load.zsh
  prompt.zsh
  settings.zsh
  functions.zsh
  aliases.zsh
  mappings.zsh
) {
  source $ZDOTDIR/config/$file
}
unset file

# Start graphical server on user's current tty if not already running.

#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Wayland >/dev/null 2>&1 && exec startx "$XINITRC"

if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
  MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
fi

