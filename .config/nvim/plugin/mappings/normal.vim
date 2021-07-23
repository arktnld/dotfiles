" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v

" Set highlight search when navigate on searching matchers.
nnoremap n :silent set hlsearch <Bar> normal! n<Enter>
nnoremap N :silent set hlsearch <Bar> normal! N<Enter>

" Override Ex mode with run @q.
nnoremap Q @q

" Always send contents of a `x` command to the black hole register.
nnoremap x "_x

" Make `Y` acting like `C`, `D`.
nnoremap Y y$

" Lookup definition under cursor.
nnoremap gt K

" Quick switch buffer [number]+s.
nnoremap s <C-^>

" Scroll viewport faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Disable highlight search.
nnoremap <silent> <ESC> :set nohlsearch<Enter>

" Navigation mappings for [l]ocation list.
" nnoremap <silent> =ol :lopen<Enter>
" nnoremap <silent> [l :lprevious<Enter>
" nnoremap <silent> ]l :lnext<Enter>
" nnoremap <silent> [L :lpfile<Enter>
" nnoremap <silent> ]L :lnfile<Enter>
" nnoremap <silent> [<C-l> :lfirst<Enter>
" nnoremap <silent> ]<C-l> :llast<Enter>

" Navigation mappings for [a]rgument list.
" nnoremap <silent> =oa :args<Enter>
" nnoremap <silent> [a :previous<Enter>
" nnoremap <silent> ]a :next<Enter>
" nnoremap <silent> [A :first<Enter>
" nnoremap <silent> ]A :last<Enter>

" Navigation mappings for ta[g]s.
" nnoremap <C-]> g<C-]>
" nnoremap <silent> =og :tags<Enter>
" nnoremap <silent> [g :pop<Enter>
" nnoremap <silent> ]g :tag<Enter>
