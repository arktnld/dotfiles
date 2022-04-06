scriptencoding UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    [1]	    [2]       [3]                                  [4]				"
"   0 ⚠ 0 	  (master) 	gin/statusline.vim                  05/68 / 32    	"
"  ------- 	 --------   ---------------------               ------------    	"
"     |_   	     |__       |__                            ___| 	__|   |__      	"
"       |  	        |         |                          |     |         |     	"
"       |  	      git()      fileprefix()                |   spell()     |     	"
"      linter()                                        %l/%c    	    %L  	"
"                                                                          	    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" [1] Linter status, error and warnings count with Unicode symbols.
set statusline+=%{repeat('\ ',2)} " Generate space characters given number of times.
" set statusline+=%#LinterError#
" set statusline+=%{statusline#errors()}
" set statusline+=%#LinterWarning#
" set statusline+=%{statusline#warnings()}
" set statusline+=%#StatusLine#

" Truncate lines to left if they are too long.
set statusline+=%<

" [2] Git HEAD status.
set statusline+=%{statusline#git#sign()}

" [3] Relative path to file's directory with trailing '/'.
set statusline+=%{statusline#file#prefix()}

" Align all items to right from this point on.
set statusline+=%=


" [4] Line numbers and column numbers in <Line>:<Column> format.
set statusline+=%02l/%02c
set statusline+=%{statusline#file#spell()} " Show icon for spell option.
set statusline+=%02L
set statusline+=%{repeat('\ ',2)}
