# Core
alias sudo='sudo --preserve-env' # Use current user config files.
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias mkdir='mkdir --parents' # Make missing parent directories when creating folders.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias ag='ag --hidden' # Include hidden folders and files on search results.
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Grep with colors and ignore common directories.
alias ip='ip -color' # Use `ip` utility always with colors.
alias ls='exa --all --classify --color=always --group-directories-first --sort=extension'  # List name of nodes.
alias lo='exa --oneline --all --classify --color=always --group-directories-first --sort=extension'  # List name of nodes.
alias ll="exa --long --all --group --header --classify --group-directories-first --sort=modified --git"

# Shortcuts
alias q='exit'
alias pacman='sudo pacman'
alias erase='sudo rm -r'
alias n='nnn' # simple file manager
alias d='wget $(xclip -selection clipboard -out)'
alias calc='bc -l <<<' # Simple calculator, only expressions without space.
alias tree='exa --classify --color=always --group-directories-first --sort=extension --tree'
alias pbcopy='xclip -selection clipboard' # Copy terminal output.
alias pbpaste='xclip -selection clipboard -out' # Paste text on clipboard.

# Clean up
alias steam='~/.local/bin/3rd/steam' # Runs steam without creating garbage in the home dir.
alias weechat='weechat --dir="$HOME/.config/weechat" --no-script'
alias p='pomo -p "$HOME/.config/pomo"'
alias megatools='megatools --config ~/.config/megatools/megarc'

# Trizen/pacman Core
alias t='trizen'
alias tsn='trizen --sync --noconfirm'
alias trn='trizen --remove --nosave --recursive --noconfirm'
alias tp='pacman --sync --search' # Search only on Arch Official Repository.
alias ta='trizen --sync --aur --search' # Search only on Arch User Repository.
alias up='trizen --sync --refresh --sysupgrade'

# Package Info
alias pkglist='trizen -Ql' # List all files in a package.
alias pkgowns='trizen -Qo' # Shows the package that owns a command.
alias pkginfo='trizen -Si' # Info about a package.
alias aurcomments='trizen -C' # Show commends in an aur pack.
