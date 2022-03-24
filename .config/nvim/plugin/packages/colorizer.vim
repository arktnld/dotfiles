"
" Highlight HEX and RGB color codes and names in their background.
"

nnoremap <silent> <Leader>c :packadd colorizer <Bar> ColorizerToggle<Enter>

" Skip comments from being colored.
let g:colorizer_skip_comments = v:true

" Disable highlighting color names.
let g:colorizer_colornames = v:false
