" For a paranoia.
" Normally `:set nocp` is not needed, because it is done automatically
" when .vimrc is found.
if &compatible
	" `:set nocp` has many side effects. Therefore this should be done
	" only when 'compatible' is set.
	" set nocompatible
endif

function! PackInit() abort


	" minpac is loaded.
	packadd minpac
	call minpac#init()

	" Core plugins on startup.
	call minpac#add('dense-analysis/ale') " Linting
	call minpac#add('tpope/vim-fugitive') " Control git repo
	call minpac#add('mhinz/vim-signify') " Git status diff
	call minpac#add('sheerun/vim-polyglot') " Code packs configs
	call minpac#add('tmsvg/pear-tree') " Auto pair
	call minpac#add('vimwiki/vimwiki')

	" Additional plugins here.
	call minpac#add('k-takata/minpac', {'type': 'opt'}) " Simple plugin manager
	call minpac#add('lilydjwg/colorizer', {'type': 'opt'}) " Color rgb text
	call minpac#add('sjl/gundo.vim', {'type': 'opt'}) " Undo tree visualization
	" call minpac#add('neoclide/coc.nvim', {'type': 'opt'}) " Language server
	" call minpac#add('sunaku/vim-dasht', {'type': 'opt'})
	" call minpac#add('flipcoder/vim-textbeat', {'type': 'opt'})

	" call minpac#add('dart-lang/dart-vim-plugin', {'type': 'opt'})
	" call minpac#add('thosakwe/vim-flutter', {'type': 'opt'})
endfunction

" Plugin settings here.

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
