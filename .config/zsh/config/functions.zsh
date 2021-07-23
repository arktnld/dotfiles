# Functions

torrent() {
	aria2c --follow-torrent=mem --seed-time=0 --console-log-leve=error "$@"
}

youtube-mp3() {
	youtube-dl --extract-audio --audio-format mp3 "$@"
}

pkgnew() {
	file1=/tmp/pkgnewfile1
	file2=/tmp/pkgnewfile2
	cat ~/.config/pkglist.csv | sed 's/#.*//' | sed -e 's/A\(,\)/\1/' -e 's/,\(.*\),".*/\1/' -e '/^[[:space:]]*$/d' | tr -d ',' | sort > $file1
	@-packages-list-user | sort > $file2
	diff -uB $file2 $file1 | diff-so-fancy | less
}

# Preview markdown files.
function mdvw() {
	smu -n "$1" > /tmp/preview.html
	w3m /tmp/preview.html
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

# Git commit browser
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

# Fancy git diff status
gitdiff() {
    local cmd files opts
    cmd="git diff --color=always -- {} | diff-so-fancy"
    files="$*"
    [[ "$#" -eq 0 ]] && files=$(git rev-parse --show-toplevel)

    opts=" +m -0 --preview=\"$cmd\" --bind=\"enter:execute($cmd |LESS='-R' less)\" "
    git ls-files --modified "$files" |
        FZF_DEFAULT_OPTS="$opts" fzf
}

# Check git current dir status.
gitcheck() {

	file1=/tmp/gitfilediff1
	file2=/tmp/gitfilediff2

	# git ls-tree -r master --name-only | grep . > $file1
	git status . | cut -d' ' -f3 | sort > $file1
	find . -type f | sed -e 's#^./##' | sort > $file2

	diff -uB $file1 $file2 | diff-so-fancy | less
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

	all_packages=/tmp/all.list
	base_packages=/tmp/base.list

	pacman -Qeq | sort > "$all_packages"
	pacman -Qgq base base-devel | sort > "$base_packages"

	comm -23 "$all_packages" "$base_packages"
}

@-packages-last-20-installed() {
	expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20
}
@-packages-list-browser() {

	pacman -Qq | fzf --height='99%' --preview-window='right:70%' --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}

# List all packages not in pacman sync dbs, like aur packages.
@-packages-list-user-foreign() {
	trizen -Qmq | sort
}

# List all dependences packages, not base or base-devel groups.
@-packages-list-user-deps() {

	all_packages=/tmp/all.list
	base_packages=/tmp/base.list

	pacman -Qdq | sort > "$all_packages"
	pacman -Qgq base base-devel | sort > "$base_packages"

	comm -23 "$all_packages" "$base_packages"
}

@-packages-list-size() {
	pacman -Qi |
	awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' |
	sort -h
}

# List all installed packages not base or base-devel groups with info.
@-packages-list-user-info() {
	expac -HM '%-20n\t%10d' "$(@-list-user-installed-packages)"
}

# Update mirrorlist by best match from speed test.
@-update-mirrolist() {

	sudo reflector \
	--verbose \
	--latest 40 \
	--number 10 \
	--sort rate \
	--protocol http \
	--save /etc/pacman.d/mirrorlist
}

# Remove everything but not the base and base-devel group.
@-remove-all-keep-base() {

	all_packages=/tmp/all.list
	base_packages=/tmp/base.list

	pacman -Qq | sort > "$all_packages"
	for i in $(pacman -Qqg base base-devel); do pactree -ul "$i"; done | sort -u > "$base_packages"

	installed_by_user_packages=$(comm -23 "$all_packages" "$base_packages")
	sudo pacman -R $installed_by_user_packages
}

@-show-music-notes() {
	ffplay -hide_banner -f lavfi \
		"amovie='$1', asplit [a][out1]; [a] showcqt=size=1400x1052 [out0]";
}

# Remove orphaned packages from old build packages.
@-orphans-remove() {
	trizen --remove --nosave --recursive #(pacman -Qtdq)
}

# Install from a file list of packages.
@-multi-install() {
	trizen -Sync --needed - < "$1"
}

@-remove-unused-packages() {
	sudo pacman -Rns $(pacman -Qtdq)
}

@-remove-unused-and-optionally-packages() {
	sudo pacman -Rns $(pacman -Qttdq)
}

# vi: ft=sh
