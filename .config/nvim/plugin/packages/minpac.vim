"
" A minimal package manager
"

function! PackInit() abort


	" minpac is loaded.
	packadd minpac
	call minpac#init()

	" Core plugins on startup.
	call minpac#add('dense-analysis/ale') " linting
	call minpac#add('mhinz/vim-signify') " git status diff
	call minpac#add('sheerun/vim-polyglot') " code packs configs
	call minpac#add('tmsvg/pear-tree') " auto pair
    call minpac#add('b3nj5m1n/kommentary') " comment motion
    call minpac#add('mateusbraga/vim-spell-pt-br') " pt_BR Dict
    call minpac#add('lukas-reineke/indent-blankline.nvim') " indentation guides lines
    call minpac#add('vigoux/LanguageTool.nvim') " Gramma check

	" Additional plugins here.
	call minpac#add('k-takata/minpac', {'type': 'opt'}) " simple plugin manager
	call minpac#add('vimwiki/vimwiki', {'type': 'opt'}) " personal wiki
	call minpac#add('lilydjwg/colorizer', {'type': 'opt'}) " color rgb text
	call minpac#add('mcchrish/nnn.vim', {'type': 'opt'}) " file manager
    call minpac#add('sunaku/vim-dasht', {'type': 'opt'}) " code docs
    call minpac#add('iamcco/markdown-preview.nvim', {'type': 'opt', 'do': 'packadd markdown-preview.nvim | call mkdp#util#install()'}) " markdown Browser Preview

endfunction

" Plugin settings here.

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! MinpackUpdate call PackInit() | call minpac#update()
command! MinpackClean  call PackInit() | call minpac#clean()
command! MinpackStatus call PackInit() | call minpac#status()
