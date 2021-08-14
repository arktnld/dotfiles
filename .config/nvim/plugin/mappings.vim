" Disable arrows in normal and visual mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""" Normal Mappings

" Pane nagivation.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Override Ex mode with run @q.
nnoremap Q @q

" Always send contents of a `x` command to the black hole register.
nnoremap x "_x

" Always search with 'very magic' mode.
nnoremap / /\v
nnoremap ? ?\v

" Set highlight search when navigate on searching matchers.
nnoremap n :silent set hlsearch <Bar> normal! n<Enter>
nnoremap N :silent set hlsearch <Bar> normal! N<Enter>
nnoremap <silent> <ESC> :set nohlsearch<Enter>

""" Command Mappings

" command mode easy navigation.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" Construct substitute and global command with 'very magic' mode.
cnoremap :s substitute/\v//gc<Left><Left><Left><Left>
cnoremap :g global/\v/<Left>

" Move between matches without leaving incremental search.
cnoremap <expr> <Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() ==# '/' \|\| getcmdtype() ==# '?' ? '<Enter>?<C-r>/' : '<S-Tab>'

""" Leader Mappings

" Shortcuts for quiting.
nnoremap <silent> <Leader>q :quit!<Enter>
nnoremap <silent> <Leader>Q :quitall<Enter>

" Insert extra new line
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

""" Insert Mappings

" Cycle through completion items when popup menu is visible, trigger completion upon written words.
inoremap <silent><expr> <Tab> mappings#insert#handle#tab({ 'key': "\<Tab>" })
inoremap <silent><expr> <S-Tab> mappings#insert#handle#tab({ 'key': "\<S-Tab>" })
inoremap <silent><expr> <Enter> mappings#insert#handle#enter()

