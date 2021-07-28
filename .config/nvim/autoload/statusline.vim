scriptencoding UTF-8

function! statusline#fileprefix() abort
	let l:basename = expand('%:p:H')

    return ''. l:basename
endfunction

function! statusline#spell() abort
	if !&spell
		return ' ' . ' '
	endif

	return ' ' . ' '
endfunction

function! statusline#git() abort
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

function! statusline#warnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf("\uf071 " . '%d ', all_non_errors)
endfunction

function! statusline#errors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf(" \uf05e " . '%d ', all_errors)
endfunction
