# Functions

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

@-gnome-reset() {
    dconf reset -f /org/gnome/
}

@-packages-last-installed() {
    # needs paclast package.
    paclast | tac | tail -n20

}

# @-show-music-notes() {
# 	ffplay -hide_banner -f lavfi \
# 		"amovie='$1', asplit [a][out1]; [a] showcqt=size=1400x1052 [out0]";
# }

# vi: ft=sh
