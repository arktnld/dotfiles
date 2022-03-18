# Finish if there isn't a plugins directory.
if (! [[ -d "$ZDOTDIR/plugins/" ]]) {
  return 1
}

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZDOTDIR/plugins/autosuggestions/zsh-autosuggestions.zsh"
