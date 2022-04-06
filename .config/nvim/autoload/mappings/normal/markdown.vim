""
" Press `<Enter>` to edit markdown link file under cursor, create if not exists or
" create directory and file, and go back with `<Backspace>` to the directory upward.
" Modified version of vimwiki plugin.
"
" nnoremap <silent> <enter> :call mappings#normal#markdown#nextfile()<enter>
" nnoremap <silent> <backspace> :call mappings#normal#markdown#previousfile()<enter>
"
" @param {file} jump to file on markdown link.
""
function! mappings#normal#markdown#checkfile()

    let l:path = expand("%:p:h") . '/' . expand("<cfile>")
    execute 'edit' l:path

    let l:dir = expand("%:p:h")
    let l:checkdir = isdirectory(l:dir)

    if l:checkdir == 0
        let l:choice = confirm('Create new directory?', "&Y\n&N", 1)
        if l:choice == 1
            call mkdir(l:dir)
        else
            bdelete
        endif
    endif

endfunction

function! mappings#normal#markdown#nextfile() abort
    let save_pos = getpos(".")
    normal 0
    try
        if search('(.*)','c', line('.'))
            normal gf
        else
            call setpos('.', save_pos)
        endif
    catch
        call mappings#normal#markdown#checkfile()
    endtry
endfunction

function! mappings#normal#markdown#previousfile()
    let current_win = buffer_number()
    if current_win != 1
        bdelete
    endif
endfunction
