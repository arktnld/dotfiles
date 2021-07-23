# Insert Mode
bindkey -M viins '^K' up-history
bindkey -M viins '^J' down-history
bindkey -M viins '^F' vi-forward-char
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char
bindkey -M viins '^R' user-fuzzy-history

# Normal Mode
bindkey -M vicmd 'j' down-line # Override `down-line-or-history`.
bindkey -M vicmd 'k' up-line # Override `up-line-or-history`.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Register functions as widgets.
eval zle -N user-fuzzy-history

# Select command from history into the command line.
function user-fuzzy-history() {
  if ! (( $+commands[fzf] )) {
    return 1
  }

  setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

  local selected=($(
    fc -l 1 \
    | fzf \
      --tac \
      --nth='2..,..' \
      --tiebreak='index' \
      --query="${LBUFFER}" \
      --exact
  ))

  local stat=$?

  if [[ "$selected" != '' ]] {
    local num=$selected[1]

    if [[ "$num" != '' ]] {
      zle vi-fetch-history -n $num
    }
  }

  zle reset-prompt
  return $stat
}

