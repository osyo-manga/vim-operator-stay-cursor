scriptencoding utf-8
if exists('g:loaded_operator_stay_cursor')
  finish
endif
let g:loaded_operator_stay_cursor = 1

let s:save_cpo = &cpo
set cpo&vim

map <expr> <Plug>(operator-stay-cursor-yank) operator#stay_cursor#wrapper("y")
map <expr> <Plug>(operator-stay-cursor-delete) operator#stay_cursor#wrapper("d")
map <expr> <Plug>(operator-stay-cursor-change) operator#stay_cursor#wrapper("c")

let &cpo = s:save_cpo
unlet s:save_cpo
