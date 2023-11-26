# Functions
function venv-activate() {
    local folder=${PWD##*/}
    local activation="venv-$folder/bin/activate"
    source "$activation" 2> /dev/null
}


function venv() {
    local folder=${PWD##*/}
    local activation="venv-$folder/bin/activate"

    if test -f "$activation"; then
        source "$activation" 2> /dev/null
    else
        echo "Creating venv..."
        python -mvenv "venv-$folder"
        echo "Created"

        source "$activation" 2> /dev/null
    fi
}

rec() {
    simplescreenrecorder --start-recording --start-hidden --settingsfile="$HOME/.config/ssr/settings.conf"
}
wiki() {

    if [ -z "$@" ]; then
        nvim "$HOME/Documents/wiki/index.md"
    elif [ "$@" == "search" ]; then
        local file=$(find ~/Documents/wiki -type f -not -path "/home/arktnld/Documents/wiki/.*" |
            sed 's#/home/arktnld/Documents/wiki/##' |
            fzf --exact --prompt='wiki ')
        [[ -n "$file" ]] && nvim "$HOME/Documents/wiki/$file"
    elif [ "$@" == "show" ]; then
        local file=$(find ~/Documents/wiki -type f -not -path "/home/arktnld/Documents/wiki/.*" |
            sed 's#/home/arktnld/Documents/wiki/##' |
            fzf --exact --prompt='wiki ')
        [[ -n "$file" ]] && glow "$HOME/Documents/wiki/$file"
    else
        echo "ERROR: Option \"$@\" NOT Found.\n"
        echo "Available options are:\n"
        echo "search    to search for a file"
        echo "show      to show for a file"
    fi

    return 0
}

cht-plain() {
    export CHTSH_QUERY_OPTIONS="T"
    cht.sh "$@";
    export CHTSH_QUERY_OPTIONS="style=trac"
}

torrent() {
	aria2c --follow-torrent=mem --seed-time=0 --console-log-leve=error "$@"
}

youtube-mp3() {
	youtube-dl --extract-audio --audio-format mp3 "$@"
}

function cd() {
	# if empty search for a file
	if [[ -z "$1" ]]; then
		local dirpath
		dirpath=$(
			find "$HOME" -type d |
				cut -d'/' -f4- |
				fzf --exact \
					--prompt='cd '
		)
		# Check if variable is not empty.
		if [ -n "$dirpath" ]; then
			local dir="$HOME/$dirpath"
			builtin cd "$dir" && return
		else
			cd "$HOME" && return
		fi
	fi

	builtin cd "$*" || return
}

function v() {
	# check if output is from stdin.
	if [ ! -t 0 ]; then
		nvim < /dev/stdin
	# if empty search for a file
	elif [ -z "$*" ]; then

		# Search for a file.
		local filepath
		filepath=$(
			find "$HOME" -type f |
				cut -d'/' -f4- |
				fzf --exact \
					--prompt='nvim '
		)

		# Check if variable is not empty.
		if [ -n "$filepath" ]; then
			local file
			file="$HOME/$filepath"
			nvim "$file"
		else
			nvim
		fi

	else
		nvim "$@"
	fi
}

# Git

# Easy git clone
clone () {
	[ "$#" -eq 0 ] && git clone "$(xclip -selection clipboard -out)" && return
	REPO="$1"
	shift
	git clone https://github.com/"$REPO" "$@"
}

function gitup() {
    local cmmt
    git status
    echo -ne "\nCommit: "; read -r cmmt
    echo
    git add --all
    git commit --message "$cmmt"
    git push --quiet --set-upstream origin master
}

gitcommit() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

gitls() {
    local dir="$@"
    if [[ -z "$dir" ]] && dir="."
    local bold=$(tput bold)
    local normal=$(tput sgr0)

    ls "$dir"

    local ignored=$(git ls-files "$dir" --ignored --exclude-standard --others)
    if [[ ! -z "$ignored" ]] && echo -e "\n""$bold""Ignored Files""$normal\n""\n$ignored" || echo -e "$bold""\nNo Ignored Files""$normal"

    local untracked=$(git ls-files "$dir" --exclude-standard --others )
    if [[ ! -z "$untracked" ]] && echo -e "\n""$bold""Untracked Files""$normal\n""\n$ignored" || echo -e "$bold""\nNo Untracked Files""$normal"
}

github() { # see ditfiles on github
    local user=$(whoami)
    local args="${@/$HOME\//}"
    xdg-open "https://github.com/$user/dotfiles/tree/master/$args" >/dev/null 2>&1
}

# Useful scripts

# Always look on your most used commands and create shotcuts.
@-most-used-commands() {
	fc -l +1 |
	awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' |
	grep -v "./" |
	column -c3 -s " " -t |
	sort -nr |
	nl |
	head -n10
}

# List all installed packages, not base or base-devel groups.
@-packages-list-user() {
    comm -23 <(pacman -Qeq | sort ) <(pacman -Qgq base base-devel | sort)
}

# List all packages not in pacman sync dbs, like aur packages.
@-packages-user-aur-foreign() {
	paru -Qmq | sort
}

@-packages-list-size() {
	pacman -Qi |
	awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' |
	sort -h
}

# Remove orphaned packages from old build packages.
@-orphans-remove() {
	paru --remove --nosave --recursive $(pacman -Qtdq | xargs)
}

@-file-owner() {
    # needs pamac package.
    pamac search --files "$1"
}

@-chromium-app() {

local website="$1"
local website=${website/http:\/\//https:\/\/}

if [[ ! $website == https://* ]]; then
    website="https://$website"
fi
local name=${website#https://}

local info="[Desktop Entry]
Version=1.0
Type=Application
Name=$name
Exec=chromium --app=$website
Icon=/path/to/icon.png
Terminal=false
Categories=Network;WebBrowser;
"
echo $info > ~/.local/share/applications/"$name".desktop
}

@-send-email-payment() {
# Email Configuration
local sender="arktnld@gmail.com"
# local recipient="gentegestao@agenciadedados.com.br"
recipient="clebersongs@gmail.com"
local subject="Cleberson Pagamento "$(date -u "+%b %y")
local body=""

# File Attachment
local att1=$(realpath "$1")
local att2=$(realpath "$2")

# Command to send email using NeoMutt
echo -e "Subject: $subject\n \n\n$body" | neomutt -s "$subject" -e "set from=$sender" -a "$att1" -a "$att2" -- "$recipient"
}

@-packages-last-installed() {
    # needs paclast package.
    paclast | tac | tail -n20
}

@-apps-using-internet() {
    lsof -P -i -n | cut -f 1 -d " " | uniq | tail -n +2
}

@-new-programs-to-remember() {
    newprograms
}

hide_on_open() {
    tdrop -a auto_hide; "$@" && tdrop -a auto_show
}

# @-gnome-reset() {
#     dconf reset -f /org/gnome/
# }

# @-show-music-notes() {
# 	ffplay -hide_banner -f lavfi \
# 		"amovie='$1', asplit [a][out1]; [a] showcqt=size=1400x1052 [out0]";
# }

# vi: ft=sh
