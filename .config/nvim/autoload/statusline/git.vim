function! statusline#git#sign() abort
	let l:path=expand('%:p:H')
	let l:path=system("readlink -f " . l:path)
	let l:path=substitute(l:path, '\n', '', 'g')
	let l:path=substitute(l:path, '/home/arktnld/', '', 'g')
	let l:stats=len(system("git ls-files --full-name /home/arktnld | grep -x " . l:path))

	if l:stats < 1
		return ''
	endif

	let b:gitbranch=""
	let l:dir=expand('%:p:h')
	let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
	let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "

	return b:gitbranch
endfunction
