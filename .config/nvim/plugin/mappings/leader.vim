" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit!<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Set directory to current buffer.
nnoremap <silent> <Leader>c :call mappings#leader#setdir#()<Enter>

" Toggles between last buffer.
nnoremap <silent> <Leader><CR> :e #<CR>

nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P

nnoremap <silent> <Leader>y "+y

" Toggle zoom current buffer in the new tab.
nnoremap <silent> <Leader>z :call mappings#normal#zoom#()<Enter>

" Open URL under cursor in browser or open path in GUI explorer.
nnoremap <silent> <Leader>b :execute printf('silent !qutebrowser "%s" 2>/dev/null && tdrop -w 1000 -h 800 -x 140 -y 100 qutebrowser', expand('<cfile>'))<Enter>


" Select last changed or yanked area.
nnoremap <expr> <Leader>v '`[' . strpart(getregtype(), 0, 1) . '`]'

" Toggle common options.
nnoremap <silent> <Leader>os :set spell!<Enter>
nnoremap <silent> <Leader>ow :set wrap!<Enter>
nnoremap <silent> <Leader>oh :set hlsearch!<Enter>
nnoremap <silent> <Leader>ol :set list!<Enter>
nnoremap <silent> <Leader>op :set paste!<Enter>

" List next, and close buffers.
nnoremap <silent> <Leader>l :buffers!<Enter>
nnoremap <silent> <Leader>j :next<Enter>
nnoremap <silent> <Leader>k :next<Enter>
nnoremap <silent> <Leader>w :bp<bar>sp<bar>bn<bar>bd<CR>
