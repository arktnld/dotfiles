"
" A minimal package manager
"

function! PackInit() abort


	" minpac is loaded.
	packadd minpac
	call minpac#init()

	" Core plugins on startup.
	call minpac#add('dense-analysis/ale') " Linting
	call minpac#add('mhinz/vim-signify') " Git status diff
	call minpac#add('sheerun/vim-polyglot') " Code packs configs
	call minpac#add('tmsvg/pear-tree') " Auto pair

	" Additional plugins here.
	call minpac#add('k-takata/minpac', {'type': 'opt'}) " Simple plugin manager
	call minpac#add('vimwiki/vimwiki', {'type': 'opt'}) " personal wiki
	call minpac#add('lilydjwg/colorizer', {'type': 'opt'}) " Color rgb text
	call minpac#add('mcchrish/nnn.vim', {'type': 'opt'}) " File manager
	"
endfunction

" Plugin settings here.

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
