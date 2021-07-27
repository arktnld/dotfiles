#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Bin local path for all folders.
export PATH="$PATH:$(find $HOME/.local/bin -type d | tr '\n' ':')"

# Initialize $PATH with system binaries.
path=(
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)

export LANG='en_US.UTF-8'
export GPG_TTY=$(tty)
export MANWIDTH='100'
export MANPAGER="nvim +'set filetype=man' -"
export PYTHONUSERBASE="$HOME/.local"
export CHTSH_QUERY_OPTIONS="style=trac"

# Default programs:
export EDITOR="nvim"
export TERMINAL="tilix"
export BROWSER="chromium"
export FILE='nautilus'
export PAGER='less'

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/32"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/mbsync/config"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export PULSE_COOKIE="$HOME/.config/pulse/cookie"
export MEDNAFEN_HOME="$HOME/.config/mednafen"
# export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
#export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
#export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export STARTDICT_DATA_DIR=
export SDCV_HISTORY=$HOME/.config/stardict/history
export SDCV_HISTORYSIZE=

# fzf
export FZF_DEFAULT_COMMAND="\
  find . \
  \( -type d -name 'node_modules' -o -type d -name '.git' \) -prune \
  -o -type f -print"
export FZF_DEFAULT_COLORS='--color=dark,fg:-1,bg:-1,hl:4,fg+:7,bg+:8,gutter:-1,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="\
  $FZF_DEFAULT_COLORS \
  --exact \
  --no-multi \
  --no-mouse \
  --height='40%' \
  --margin='1,3' \
  --layout='reverse' \
  --info='inline' \
  --no-bold \
  --jump-labels='asdfghjkl;' \
  --bind='ctrl-f:jump-accept'"

# less
export LESS="\
  --ignore-case \
  --tilde \
  --chop-long-lines \
  --status-column \
  --LONG-PROMPT \
  --jump-target=10 \
  --RAW-CONTROL-CHARS \
  --clear-screen \
  --silent \
  --tabs=4 \
  --shift=5"
export LESSHISTFILE='-' # Disable history.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# This is the list for lf icons:
#export LF_ICONS="di=📁:\
#fi=📃:\
#tw=🤝:\
#ow=📂:\
#ln=⛓:\
#or=❌:\
#ex=🎯:\
#*.txt=✍:\
#*.mom=✍:\
#*.me=✍:\
#*.ms=✍:\
#*.png=🖼:\
#*.webp=🖼:\
#*.ico=🖼:\
#*.jpg=📸:\
#*.jpe=📸:\
#*.jpeg=📸:\
#*.gif=🖼:\
#*.svg=🗺:\
#*.tif=🖼:\
#*.tiff=🖼:\
#*.xcf=🖌:\
#*.html=🌎:\
#*.xml=📰:\
#*.gpg=🔒:\
#*.css=🎨:\
#*.pdf=📚:\
#*.djvu=📚:\
#*.epub=📚:\
#*.csv=📓:\
#*.xlsx=📓:\
#*.tex=📜:\
#*.md=📘:\
#*.r=📊:\
#*.R=📊:\
#*.rmd=📊:\
#*.Rmd=📊:\
#*.m=📊:\
#*.mp3=🎵:\
#*.opus=🎵:\
#*.ogg=🎵:\
#*.m4a=🎵:\
#*.flac=🎼:\
#*.wav=🎼:\
#*.mkv=🎥:\
#*.mp4=🎥:\
#*.webm=🎥:\
#*.mpeg=🎥:\
#*.avi=🎥:\
#*.mov=🎥:\
#*.mpg=🎥:\
#*.wmv=🎥:\
#*.m4b=🎥:\
#*.flv=🎥:\
#*.zip=📦:\
#*.rar=📦:\
#*.7z=📦:\
#*.tar.gz=📦:\
#*.z64=🎮:\
#*.v64=🎮:\
#*.n64=🎮:\
#*.gba=🎮:\
#*.nes=🎮:\
#*.gdi=🎮:\
#*.1=ℹ:\
#*.nfo=ℹ:\
#*.info=ℹ:\
#*.log=📙:\
#*.iso=📀:\
#*.img=📀:\
#*.bib=🎓:\
#*.ged=👪:\
#*.part=💔:\
#*.torrent=🔽:\
#*.jar=♨:\
#*.java=♨:\
#"

# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

# Switch escape and caps if tty and no passwd required:
# sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null
