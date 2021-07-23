" packadd jedi-vim
" packadd ncm2-jedi
" packadd semshi

" " Map to use jedi autocomplete with ultisnips.
" imap <silent><expr> <c-u> IsExpandable() ? "\<C-R>=UltiSnips#ExpandSnippet()\<Enter>" : "\<Plug>(ncm2_manual_trigger)"

"
" nnoremap <buffer><silent> <LocalLeader>r :execute 'split <Bar> terminal python %'<Enter>

" Use 'fmt' command to auto indent text with '='.
set equalprg=yapf
