"
" VimWiki is a personal wiki
"

"" Add optional plugin to 'runtimepath' without sourcing anything.
packadd! vimwiki

" Source plugin file and run command.
noremap <silent> <Leader>v :runtime! plugin/**/vimwiki.vim <Bar> :VimwikiIndex<Enter>

" Syntax highlight for code using vim filetype.
let g:automatic_nested_syntaxes = 1

" Wide preformatter
let g:vimwiki_conceal_pre = 1

" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
