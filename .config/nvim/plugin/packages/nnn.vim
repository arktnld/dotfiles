"
" NNN Simple and fast file manager
"

"" Add optional plugin to 'runtimepath' without sourcing anything.
packadd! nnn

" Source plugin file and run command.
noremap <silent> <Leader>n :runtime! plugin/**/nnn.vim <Bar> :NnnPicker %:p:h<Enter>

" Put file manager on the left
let g:nnn#layout = {
            \'window': {
                \ 'width': 0.43,
                \ 'height': 0.8,
                \ 'highlight': 'Debug' } }

" Env and flags
let g:nnn#command = 'nnn -cEHo'
let $NNN_OPENER="/usr/share/nnn/plugins/nuke"
let $NNN_TRASH="n (n=1: trash-cli, n=2: gio trash)"

" Custom mappings
let g:nnn#action = {
    \ '<c-p>': 'tab split',
    \ '<c-x>': 'split',
   \ '<c-v>': 'vsplit',
   \ '<c-[>': 'close' }
