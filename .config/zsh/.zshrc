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

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-04-25 17:32:27
export PATH="$PATH:/home/arktnld/.local/bin"
