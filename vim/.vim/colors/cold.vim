" Dark and cold colored theme
"
" Inspired by:
" vim-gotham https://github.com/whatyouhide/vim-gotham
" dracula    https://github.com/dracula
"

hi clear

if exists('syntax_on')
	syntax reset
endif

" Disable user defined function highlighting for doctol/vim-cpp-enhanced-highlight
let g:cpp_no_function_highlight=1

set background=dark
let g:colors_name = 'cold'


let s:none = ['NONE', 'NONE']

function! s:hi(id, fg, ...)
	let l:cmd = [a:id]
	let l:fg = copy(a:fg)
	let l:bg = get( a:, 1, s:none )

	let l:cmd = add( l:cmd, 'guifg=' . get(l:fg, 0) )
	let l:cmd = add( l:cmd, 'ctermfg=' . get(l:fg, 1) )

	let l:cmd = add( l:cmd, 'guibg=' . get(l:bg, 0) )
	let l:cmd = add( l:cmd, 'ctermbg=' . get(l:bg, 1) )

	let l:attrs = a:0 > 1 ? join(a:2, ',') : 'NONE'
	let l:cmd = add( l:cmd, 'gui=' . l:attrs )
	let l:cmd = add( l:cmd, 'cterm=' . l:attrs )
	let l:cmd = add( l:cmd, 'term=' . l:attrs )

	exec 'hi clear ' . a:id
	exec 'hi ' . join(l:cmd, ' ')
endfunction

function! s:mh(ids, fg, ...) 
	let l:ids = copy(a:ids)
	for id in l:ids
		call s:hi(id, a:fg, get(a:000, 0, s:none), get(a:000, 1, s:none))
	endfor
endfunction


" #0a192d pretty good
let s:base0 = [ '#17181f', 232 ]
let s:base1 = [ '#191A21', 234 ]
let s:base2 = [ '#21222C', 235 ]
let s:base3 = [ '#282A36', 236 ]
let s:base4 = [ '#343746', 237 ]
let s:base5 = [ '#424450', 238 ]
let s:base6 = [ '#6272A4', 61  ]
let s:base7 = [ '#F8F8F8', 255 ]

let s:red     = [ '#ff5555', 1   ]
let s:orange  = [ '#ffb86c', 173 ]
let s:yellow  = [ '#ffeaa7', 221 ]
let s:magenta = [ '#60a3bc', 66  ]
let s:violet  = [ '#67e6dc', 51  ]
let s:blue    = [ '#B3E5FC', 80  ]
let s:cyan    = [ '#1DE9B6', 42  ]
let s:green   = [ '#69F0AE', 84  ]

" Background and foreground
let s:bg = s:base0
let s:fg = s:base7

call s:hi('Normal', s:fg, s:bg)
call s:hi('Cursor', s:bg, s:fg)
call s:hi('CursorLine', s:none, s:base3)
call s:hi('CursorColumn', s:none, s:base2)
call s:hi('LineNr', s:base6)
call s:hi('CursorLineNr', s:bg, s:fg)
call s:hi('SignColumn', s:base6)
call s:hi('ColorColumn', s:none, s:base2)
call s:hi('Visual', s:none, s:base5)
call s:hi('Question', s:base7, s:none, ['bold'])
call s:hi('Underlined', s:base7, s:none, ['underline'])
call s:hi('Todo', s:bg, s:cyan, ['bold'])
call s:hi('Comment', s:base6)

" Keywords
let s:keywords = ['Statement', 'Conditional', 'Repeat', 'Label', 'Operator', 'Exception', 'Keyword']
call s:mh(s:keywords,  s:cyan, s:none, ['bold'])

" Includes and definition
call s:mh(['StorageClass', 'Structure', 'Typedef'], s:cyan)
call s:mh(['Include', 'Macro', 'Define', 'PreProc', 'PreCondit'], s:blue)

" Characters, Numbers, etc..
call s:mh(['Constant', 'Number', 'Boolean', 'Float'], s:fg, s:none, ['bold'])
call s:hi('String',  s:violet, s:none)
call s:hi('Character', s:violet)
call s:hi('Type', s:green)

call s:hi('Identifier', s:base7)
call s:hi('Function', s:green)
call s:hi('Delimiter', s:base7)

call s:hi('SpecialKey', s:base5)
call s:hi('Special', s:violet)
call s:hi('SpecialComment', s:cyan, s:none, ['italic'])
call s:hi('Tag', s:cyan)
call s:hi('helperHyperTestJump', s:cyan, s:none, ['underline'])
call s:hi('helpCommand', s:magenta)
call s:hi('helpExample', s:green)
call s:hi('helpBacktick', s:violet)

call s:hi('Title', s:green, s:none, ['bold'])
call s:hi('NonText', s:blue)

call s:hi('MatchParen', s:green, s:none, ['underline'])
call s:hi('Conceal', s:base6, s:base4)
call s:hi('VertSplit', s:blue)

" Folds.
call s:hi('Folded', s:base5)
call s:hi('FoldColumn', s:base6, s:base2)

" Searching.
call s:hi('Search', s:base2, s:yellow)
call s:hi('IncSearch', s:none, s:none, ['reverse'])

" Popup menu.
call s:hi('Pmenu', s:none, s:base2)
call s:hi('PmenuSel', s:none, s:base2)
call s:hi('PmenuSbar', s:none, s:base5)
call s:hi('PmenuThumb', s:none, s:base5)

" Command line stuff.
call s:hi('ErrorMsg', s:base7, s:red)
call s:hi('Error', s:red, s:base1)
call s:hi('ModeMsg', s:blue)
call s:hi('MoreMsg', s:blue, s:none, ['bold'])
call s:hi('WarningMsg', s:red)

call s:hi('StatusLineNC', s:none, s:base4)
call s:hi('StatusLine', s:none, s:base5, ['bold'])
call s:hi('WildMenu', s:bg, s:magenta, ['bold'])
call s:hi('Question', s:green)

" Tab line.
call s:hi('TabLineSel', s:fg, s:bg)  
call s:hi('TabLine', s:base6, s:base2)
call s:hi('TabLineFill', s:none, s:base0) 

" Diffing.
call s:hi('DiffAdd', s:green)
call s:hi('DiffAdded', s:green)
call s:hi('DiffChange', s:orange)
call s:hi('DiffDelete', s:red, s:base2)
call s:hi('DiffText', s:bg, s:orange)
call s:hi('DiffRemoved', s:red, s:base2)
call s:hi('DiffSubname', s:blue)

" Directories (e.g. netrw).
call s:hi('Directory', s:cyan)


