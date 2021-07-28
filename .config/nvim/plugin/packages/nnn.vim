"
" NNN Simple and fast file manager
"

"" Add optional plugin to 'runtimepath' without sourcing anything.
packadd! nnn.vim

" Source plugin file and run command.
noremap <silent> <Leader>n :runtime! plugin/**/nnn.vim <Bar> :NnnPicker %:p:h<Enter>

" Put file manager on the left
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

