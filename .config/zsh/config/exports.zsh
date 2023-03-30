# profile file. Runs on login. Environmental variables are set here.

path=(
  ~/.local/bin
  ~/.local/share/gem/ruby/3.0.0/bin
  $path
)

# Basic
export EDITOR="nvim"
export TERMINAL="tilix"
export BROWSER="chromium"
export FILE='nautilus'
export PAGER='less'
export LANG='en_US.UTF-8'

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# GnuPG
export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.config/gnupg"

# wget
export WGETRC="$HOME/.config/wget/wgetrc"

# mednafen
export MEDNAFEN_HOME="$HOME/.config/mednafen"
# golang
export GOPATH="$HOME/.local/share/go"
export GOROOT="/usr/lib/go"

# cheat.sh
export CHTSH_QUERY_OPTIONS="style=trac"

# nnn
export NNN_OPTS="cEHo"
export NNN_OPENER="/usr/share/nnn/plugins/nuke"
export NNN_TRASH="n (n=1: trash-cli, n=2: gio trash)"

# zsh plugin
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE=""
unset ZSH_AUTOSUGGEST_USE_ASYNC
# export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    forward-word
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char
)
# export ZSH_AUTOSUGGEST_MANUAL_REBIND=""

# fzf
export FZF_DEFAULT_COMMAND="\
  find . \
  \( -type d -name 'node_modules' -o -type d -name '.git' -o -type d -name 'Data' \) -prune \
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

export WINEPREFIX="$HOME/.local/share/wineprefixes/32"

# export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share/password-store"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
# export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
# export XINITRC="$HOME/.config/x11/xinitrc"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
# export PULSE_COOKIE="$HOME/.config/pulse/cookie"
# export ANSIBLE_CONFIG="$HOME/.config/ansible/ansible.cfg"
# export ANDROID_SDK_HOME="$HOME/.config/android"
# export WEECHAT_HOME="$HOME/.config/weechat"
# export PYTHONUSERBASE="$HOME/.local"
# export CARGO_HOME="$HOME/.local/share/cargo"
# export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
#
# export NODE_PATH=$NODE_PATH:$(npm root -g)
# export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
