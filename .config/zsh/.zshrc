foreach file (
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
