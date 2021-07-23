" [a]n [e]ntire buffer motion.
onoremap <silent> ae :<C-u>execute 'normal! m`' <Bar> keepjumps normal! ggVG<Enter>
xnoremap ae GoggV

" [i]nner lin[e] motion.
onoremap <silent> i_ :<C-u>normal! ^vg_<Enter>
xnoremap i_ <Esc>^vg_

