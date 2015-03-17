scriptencoding utf-8
if exists('g:loaded_operator_stay_cursor')
  finish
endif
let g:loaded_operator_stay_cursor = 1

let s:save_cpo = &cpo
set cpo&vim

map <expr> <Plug>(operator-stay-cursor-yank)    operator#stay_cursor#wrapper("y")
map <expr> <Plug>(operator-stay-cursor-delete)  operator#stay_cursor#wrapper("d")
map <expr> <Plug>(operator-stay-cursor-change)  operator#stay_cursor#wrapper("c")
map <expr> <Plug>(operator-stay-cursor-replace) operator#stay_cursor#wrapper("\<Plug>(operator-replace)", { "noremap" : 0 })
map <expr> <Plug>(operator-stay-cursor-gu)  operator#stay_cursor#wrapper("gu")
map <expr> <Plug>(operator-stay-cursor-gU)  operator#stay_cursor#wrapper("gU")
map <expr> <Plug>(operator-stay-cursor-g~)  operator#stay_cursor#wrapper("g~")

let &cpo = s:save_cpo
unlet s:save_cpo
