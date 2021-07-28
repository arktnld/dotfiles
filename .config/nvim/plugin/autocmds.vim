" Save the current buffer after any changes.
augroup savebuffer
	autocmd!
	autocmd InsertLeave,TextChanged * nested call autocmds#savebuffer#()
	autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

" Jump to last known position and center buffer around cursor.
augroup jumplast
	autocmd!
	autocmd BufWinEnter ?* call autocmds#jumplast#()
augroup end

" Remove trailing whitespace characters.
augroup trimtrailing
	autocmd!
	autocmd BufWritePre * call autocmds#trimtrailing#()
augroup end
