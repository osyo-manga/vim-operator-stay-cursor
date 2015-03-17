scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim



function! s:as_wise_key(name)
	return a:name ==# "char"  ? "v"
\		 : a:name ==# "line"  ? "V"
\		 : a:name ==# "block" ? "\<C-v>"
\		 : a:name
endfunction


let s:default_config = {
\	"noremap" : 1
\}


function! s:do(wise, op, pos, config)
	let old_selection = &selection
	let &selection = 'inclusive'
	let wise = s:as_wise_key(a:wise)
	try
		if a:config.noremap
			execute printf('silent normal! `[%s`]%s', wise, a:op)
		else
			execute printf('silent normal `[%s`]%s', wise, a:op)
		endif
	finally
		let &selection = old_selection
	endtry
	call setpos(".", a:pos)
endfunction


function! operator#stay_cursor#wrapper(op, ...)
	let s:config = extend(copy(s:default_config), get(a:, 1, {}))
	let s:pos = getpos(".")
	let s:operator = a:op
	return "\<Plug>(operator-operator-stay-cursor-dummy)"
endfunction


function! operator#stay_cursor#do(wise)
	return s:do(a:wise, s:operator, s:pos, s:config)
endfunction

call operator#user#define('operator-stay-cursor-dummy', 'operator#stay_cursor#do')

let &cpo = s:save_cpo
unlet s:save_cpo
