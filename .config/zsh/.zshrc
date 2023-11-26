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

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
