# https://github.com/jackharrisonsherlock/common

# Prompt symbol
COMMON_PROMPT_SYMBOL=""

# Colors
COMMON_COLORS_HOST_ME=green
COMMON_COLORS_HOST_AWS_VAULT=yellow
COMMON_COLORS_RETURN_STATUS_TRUE=244
COMMON_COLORS_RETURN_STATUS_FALSE=red
COMMON_COLORS_BG_JOBS=yellow
# COMMON_COLORS_GIT_STATUS_DEFAULT=green
# COMMON_COLORS_GIT_STATUS_STAGED=red
# COMMON_COLORS_GIT_STATUS_UNSTAGED=11
# COMMON_COLORS_GIT_PROMPT_SHA=green

# Left Prompt
 PROMPT=' $(common_host)$(common_bg_jobs)$(common_return_status)'

# Right Prompt
 # RPROMPT='$(common_git_status)'

# Host
common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_ME]%}$me%{$reset_color%}:"
  fi
  if [[ $AWS_VAULT ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
  fi
}

# Prompt symbol
common_return_status() {
  echo -n "%(?.%F{$COMMON_COLORS_RETURN_STATUS_TRUE}.%F{$COMMON_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f "
}

# Git status
# common_git_status() {
#     local message=""
#     local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    # local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    # local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    # if [[ -n ${staged} ]]; then
    #     message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
    # elif [[ -n ${unstaged} ]]; then
    #     message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
    # fi

    # local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    # if [[ -n ${branch} ]]; then
    #     message+="${message_color}${branch}%f"
    # fi

    # echo -n "${message}"
# }

# Git prompt SHA
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$COMMON_COLORS_GIT_PROMPT_SHA}%}"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

# Background Jobs
common_bg_jobs() {
  local bg_status="%{$fg[$COMMON_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
