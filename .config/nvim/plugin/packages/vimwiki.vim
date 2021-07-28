"
" VimWiki is a personal wiki
"

"" Add optional plugin to 'runtimepath' without sourcing anything.
packadd! vimwiki

" Source plugin file and run command.
noremap <silent> <Leader>v :runtime! plugin/**/vimwiki.vim <Bar> :VimwikiIndex<Enter>
