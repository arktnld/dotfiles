"
" Vim fzf general-purpose command-line fuzzy finder.
"
"
" Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new tab,
" a new split, or in a new vertical split.
""

" Maps for fzf fuzzy find
nmap <silent> zp :Files<cr>
nmap <silent> zb :Buffers<cr>
nmap <silent> zl :Lines<cr>
nmap <silent> zh :History<cr>
nmap <silent> zc :History:<cr>
nmap <silent> zw :Windows<cr>
nmap <silent> zm :Maps<cr>
nmap <silent> zg :Ag<cr>
