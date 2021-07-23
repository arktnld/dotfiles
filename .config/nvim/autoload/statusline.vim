scriptencoding UTF-8

function! statusline#fileprefix() abort
	let l:basename = expand('%')

    return ''. l:basename
endfunction

function! statusline#filetypesymbol() abort
	if !exists('*WebDevIconsGetFileTypeSymbol')
		return ''
	endif

	return WebDevIconsGetFileTypeSymbol()
endfunction

function! statusline#spell() abort
	if !&spell
		return ' ' . ' '
	endif

	return ' ' . ' '
endfunction

function! statusline#git() abort
	if !exists('g:loaded_gina')
		return ''
	endif

	return gina#component#repo#branch() . ' '
endfunction

function! statusline#markdownpreview() abort
	if !exists('b:markdownpreview')
		return ''
	endif

	return ' ' . ' '
endfunction

function! statusline#nerdtree() abort
	if !exists('b:NERDTree')
		return v:false
	endif

	return substitute(b:NERDTree.root.path.str() . '/', '\C^' . $HOME, '~', '')
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
