function! statusline#file#prefix() abort
	let l:basename = expand('%:p:H')

    return ''. l:basename
endfunction

function! statusline#file#spell() abort
	if !&spell
		return '' . ' '
	endif

	return '' . ' '
endfunction

