"
" Configs for Markdown files
"

setlocal wrap
setlocal spell
setlocal conceallevel=3
setlocal foldcolumn=auto:6
setlocal nohlsearch

let g:vim_markdown_frontmatter = 1
let g:markdown_folding=1

" Map `tab` to cicle trought links.
nnoremap <Tab> :call search('\[.*\](.*)')<Enter>
nnoremap <Enter> :call search('(.*)','c', line('.')) <Bar> normal! gf<Enter>
nnoremap <Backspace> <C-o>

" Header colors
highlight htmlH1 guifg=#5fd7a7 gui=bold
highlight htmlH2 guifg=#5fd7a7 gui=bold
highlight htmlH3 guifg=#5fd7a7 gui=bold
highlight htmlH4 guifg=#5fd7a7 gui=bold
highlight htmlH5 guifg=#5fd7a7 gui=bold
highlight htmlH6 guifg=#5fd7a7 gui=bold
