function s:clear_bg(group)
	execute 'highlight ' . a:group . ' ctermbg=None'
endfunction

function s:clear_bg_all()
	let l:groups = ['Normal', 'NonText', 'LineNr', 'CursorLineNr', 'Todo',
	             \  'SignColumn', 'VertSplit']
	for group in l:groups
		call s:clear_bg(group)
	endfor
endfunction

function s:clear_auto()
	call s:clear_bg_all()
	augroup auto_nobg
		autocmd ColorScheme * call s:clear_bg_all()
	augroup END
endfunction

function s:clear_stop()
	autocmd! auto_nobg
	let l:colors_name = get(g:, 'colors_name', '')
	echomsg l:colors_name
	if l:colors_name !=# ''
		try
			execute 'colorscheme ' . l:colors_name
		endtry
	endif
endfunction

command NobgEnable  call s:clear_auto()
command NobgDisable call s:clear_stop()

autocmd VimEnter * call s:clear_auto()
