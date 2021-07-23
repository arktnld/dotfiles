" Wrap lines longer than the width of the window.
setlocal wrap

" Always enable spell checking.
setlocal spell

" Use 'fmt' command to auto indent text with '='.
set equalprg=fmt

" Disable all line numbers.
setlocal nonumber
setlocal norelativenumber

" Hidden all conceal text syntax.
set conceallevel=3

" Only show conceal text in insert mode.
set concealcursor=n

" Change double-dash (--) to em-dash (—) as it is typed.
inoremap <buffer> -- —

" Change plain quotes to curly quotes as they're typed.
function! InsertQuote(chr)
	let [open_quote, close_quote] = (a:chr == "'") ? ['‘', '’'] : ['“', '”']
	return getline('.')[col('.')-2] =~ '[^\t (]$' ? close_quote : open_quote
endfunction

inoremap <buffer> <expr> ' InsertQuote("'")
inoremap <buffer> <expr> " InsertQuote('"')


" Convert ASCII list bullets to Unicode bullets. {{{1
function! InsertBullet(chr)
  " Insert a UTF-8 list bullet when the user types "-".
	if getline('.')[0 : max([0, col('.') - 2])] =~ '^\s*$'
		return '•'
	endif
  return a:chr
endfunction

inoremap <buffer> <expr> - InsertBullet('-')


"
" Fold with Markdown Style
"
"

function! FoldExpr() " {{{3
  " Folding expression to fold atx style Markdown headings.
  let lastlevel = foldlevel(v:lnum - 1)
  let nextlevel = match(getline(v:lnum), '^#\+\zs')
  let retval = '='
  if lastlevel <= 0 && nextlevel >= 1
    let retval = '>' . nextlevel
  elseif nextlevel >= 1
    if lastlevel > nextlevel
      let retval = '<' . nextlevel
    else
      let retval = '>' . nextlevel
    endif
  endif
  return retval
endfunction

function! FoldText() " {{{3
  " Replace atx style "#" markers with "-" fold marker.
  let line = getline(v:foldstart)
  if line == ''
    let line = getline(v:foldstart + 1)
  endif
  let matches = matchlist(line, '^\(#\+\)\s*\(.*\)$')
  if len(matches) >= 3
	if len(matches[1]) >= 2
		let g:n = len(matches[1])
		let prefix = repeat(' ', len(matches[1]) * len(matches[1]))
		return prefix . '-' . ' ' . matches[2]
	else
		return '-' . ' ' . matches[2]
	endif
  else
    return line
  endif
endfunction

" Fold with markdown style.
setlocal foldmethod=expr
setlocal foldexpr=FoldExpr()
setlocal foldtext=FoldText()

" Close all folds levels.
setlocal foldlevel=0

