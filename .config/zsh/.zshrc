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
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-04-25 17:32:27
export PATH="$PATH:/home/arktnld/.local/bin"

# alias steam='DRI_PRIME=1 steam'
# alias godot='DRI_PRIME=1 godot'

# GPU Switching
alias gpu-check='glxinfo | grep "OpenGL renderer"'
alias gpu-amd='prime-run'
alias steam='prime-run steam'

# System info
alias temps='watch -n1 sensors'
alias gpus='switcherooctl list'

# Criar atalho
alias noite="redshift -O 3500"
alias dia="redshift -x"

eval "$(rbenv init - zsh)"

# Turso
export PATH="$PATH:/home/arktnld/.turso"

# Avante Zen Mode (Vibe Coding CLI)
alias avante='nvim -c "lua vim.defer_fn(function() require(\"avante.api\").toggle() end, 100)"'
