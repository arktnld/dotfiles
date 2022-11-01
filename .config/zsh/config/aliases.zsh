# Core
alias sudo='sudo --preserve-env' # Use current user config files.
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias mkdir='mkdir --parents --verbose' # Make missing parent directories when creating folders.
alias du='du --max-depth=1 --si . 2>/dev/null | sort -h' # Display size of files and folders under current directory.
alias ag='ag --hidden' # Include hidden folders and files on search results.
alias grep='grep --ignore-case --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Grep with colors and ignore common directories.
alias ip='ip -color' # Use `ip` utility always with colors.
alias ls='exa --all --classify --color=always --group-directories-first --sort=extension'  # List name of nodes.
alias ll="exa --long --all --group --header --classify --group-directories-first --sort=modified --git"

# Shortcuts
alias q='exit'
alias calc='bc -l <<<' # Simple calculator, only expressions without space.
alias pbcopy='xclip -selection clipboard' # Copy terminal output.
alias pbpaste='xclip -selection clipboard -out' # Paste text on clipboard.
alias d='wget $(xclip -selection clipboard -out)' # Download using link on clipboard.
alias pi='ping 1.1.1.1' # Tired of ping in google?
alias cht='cht.sh' # The only cheat sheet you need
alias rdd='tuir'

# Archive
alias ae='patool extract' # Unpack one or more archives.
alias ac='patool create' # Create an archive.
alias al='patool list' # List members or one or more archives.
alias arc='patool recompress' # Recompress an archive to smaller size.

# Package Manager
alias p='paru --sync --noconfirm'
alias pr='paru --remove --nosave --recursive --noconfirm'
alias pp='pacman --sync --search' # Search only on Arch Official Repository.
alias pa='paru --sync --aur --search' # Search only on Arch User Repository.
alias up='paru --sync --refresh --sysupgrade'

# Package Info
alias pkglist='paru -Ql' # List all files in a package.
alias pkgowns='paru -Qo' # Shows the package that owns a command.
alias pkginfo='paru -Si' # Info about a package.
