"
" Run any file and show output inside vim.
"

nnoremap <silent> <leader>o :packadd vim-run <Bar> call CmdRun()<cr>

function! CmdRun()
    call run#Update()
    call run#Run()
    execute "normal! \<C-w>j"
endfunction

" Config command to run on each file by filetype
let g:run_cmd = {
      \'c':           'gcc -Wall -Wextra -std=c99 -pedantic',
      \'c_plus':      './a.out',
      \'java':        'java',
      \'python':      'python',
      \'javascript':  'node',
      \'tsx':         'tsc --outFile %t %',
      \'tsx_plus':    'node %t',
      \'vim':         'source',
      \'go':          'go run',
      \}

