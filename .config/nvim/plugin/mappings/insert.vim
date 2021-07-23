" Cycle through completion items when popup menu is visible, trigger
" completion upon written words.
inoremap <silent><expr> <Tab> mappings#insert#handle#tab({ 'key': "\<Tab>" })
inoremap <silent><expr> <S-Tab> mappings#insert#handle#tab({ 'key': "\<S-Tab>" })


" Accept current completion or enter a new line.
inoremap <silent><expr> <Enter> mappings#insert#handle#enter()
