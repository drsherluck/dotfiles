" 
" Modified ayu_dark theme 
" Filename: cold.vim 
"

let s:base0 = '#e6e1cf'
let s:base1 = '#e6e1cf'
let s:base2 = '#3e4b59'
let s:base3 = '#e6e1cf'
let s:base00 = '#0f1419'
let s:base01 = '#0f1419'
let s:base02 = '#0f0f14'
let s:base023 = '#0f0f14'
let s:base03 = '#ff4757'
let s:yellow = '#ff4757'
let s:orange = '#ff7f50'
let s:red = '#f07178'
let s:magenta = '#eccc68'
let s:blue = '#55efc4'
let s:cyan = s:blue
let s:green = '#a29bfe'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:blue, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base01, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.inactive.right = [ [ s:base1, s:base01 ], [ s:base2, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:green, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:magenta, 'bold' ], [ s:base3, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base02, s:base03 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00, 'bold' ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#cold#palette = lightline#colorscheme#fill(s:p)
