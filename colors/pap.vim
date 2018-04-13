" Name:       pap.vin
" Version:    0.1
" Maintainer: github.com/mikker
" License:    MIT

hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'pap'


let s:black        = { "gui": "#000000", "cterm": "0" }
let s:black_rock   = { "gui": "#2D2A3B", "cterm": "0" }
let s:grape        = { "gui": "#262333", "cterm": "0" }
let s:white        = { "gui": "#ffffff", "cterm": "15" }
let s:melrose      = { "gui": "#C0BDE4", "cterm": "225" }
let s:sand         = { "gui": "#F6F3EE", "cterm": "230" }
let s:darker_sand  = { "gui": "#F2E9DB", "cterm": "228" }
let s:dark_sand    = { "gui": "#AD9F89", "cterm": "228" }
let s:lighter_gray = { "gui": "#A7907F", "cterm": "242" }
let s:gray         = { "gui": "#464357", "cterm": "244" }
let s:light_pink   = { "gui": "#EDDEEF", "cterm": "225" }
let s:violet       = { "gui": "#894F8E", "cterm": "170" }
let s:east_side    = { "gui": "#f4bfa8", "cterm": "170" }
let s:taupe        = { "gui": "#52404A", "cterm": "244" }
let s:hot_pink     = { "gui": "#EC566E", "cterm": "198" }
let s:light_green  = { "gui": "#E2E6C4", "cterm": "193" }
let s:yellow       = { "gui": "#ffd75f", "cterm": "221" }
let s:green        = { "gui": "#10A778", "cterm": "29" }
let s:dark_green   = { "gui": "#325555", "cterm": "29" }
let s:light_purple = { "gui": "#a790d5", "cterm": "140" }
let s:jumbo        = { "gui": "#636E88", "cterm": "288" }


let s:background = &background


if &background == "dark"
  let s:bg = s:black_rock
  let s:bg_darker = s:taupe
  let s:bg_dark = s:dark_sand
  let s:fg = s:sand
  let s:fg_subtle = s:melrose
  let s:string_bg = s:dark_green
  let s:constant_fg = s:east_side
  let s:comment_fg = s:jumbo
else
  let s:bg = s:sand
  let s:bg_darker = s:darker_sand
  let s:bg_dark = s:dark_sand
  let s:fg = s:gray
  let s:fg_subtle = s:lighter_gray
  let s:string_bg = s:light_green
  let s:constant_fg = s:violet
  let s:comment_fg = s:bg_dark
endif



" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction


call s:h("Normal",        {"bg": s:bg, "fg": s:fg})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
  execute "set background=" . s:background
endif


call s:h("Comment",       {"fg": s:comment_fg, "gui": "italic"})

call s:h("Constant",      {"fg": s:constant_fg})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

" call s:h("Identifier",    {"fg": s:constant_fg })
hi! link Identifier       Statement
hi! link Function         Identifier

call s:h("String",        {"fg": s:fg, "bg": s:string_bg})

call s:h("Statement",     {"fg": s:fg_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

hi! link PreProc          Constant

hi! link Type             Normal
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("SpecialKey",    {"fg": s:hot_pink})
call s:h("Special",       {"fg": s:fg, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("LineNr",       { "fg": s:comment_fg })
call s:h("CursorLineNr", { "fg": s:hot_pink })
call s:h("CursorLine",   { "bg": s:bg_darker })




call s:h("Underlined",    {"fg": s:fg, "gui": "underline", "cterm": "underline"})
call s:h("Search",        {"bg": s:yellow, "fg": s:fg})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:fg})
call s:h("Pmenu",         {"fg": s:fg, "bg": s:bg_darker})
call s:h("PmenuSel",      {"fg": s:black, "bg": s:bg_dark})
call s:h("PmenuSbar",     {"fg": s:fg, "bg": s:bg_darker})
call s:h("PmenuThumb",    {"fg": s:fg, "bg": s:bg_darker})
call s:h("MatchParen",    {"bg": s:bg_dark, "fg": s:black})

call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:white, "bg": s:hot_pink, "cterm": "bold"})
call s:h("Todo",          {"fg": s:fg, "gui": "underline", "cterm": "underline"})
call s:h("NonText",       {"fg": s:fg})
call s:h("Directory",     {"fg": s:fg})
call s:h("ErrorMsg",      {"fg": s:fg})
call s:h("MoreMsg",       {"fg": s:fg, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("Question",      {"fg": s:hot_pink})
call s:h("StatusLine",    {"bg": s:bg_darker})
call s:h("StatusLineNC",  {"bg": s:bg_darker, "fg": s:fg})
call s:h("VertSplit",     {"bg": s:bg_darker, "fg": s:bg_darker})
call s:h("Title",         {"fg": s:hot_pink})
call s:h("Visual",        {"fg": s:fg, "bg": s:melrose})
call s:h("VisualNOS",     {"bg": s:bg_darker})
call s:h("WarningMsg",    {"fg": s:hot_pink})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:fg})
call s:h("Folded",        {"fg": s:gray})
call s:h("FoldColumn",    {"fg": s:bg_darker})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:hot_pink})
call s:h("DiffChange",    {"fg": s:yellow})
call s:h("DiffText",      {"fg": s:fg})
call s:h("SignColumn",    {"fg": s:light_green})

hi link diffAdded     DiffAdd
hi link diffRemoved   DiffDelete
hi link diffNewFile   Constant
hi link diffFile      Constant

if has("nvim")
  let g:terminal_color_0 = '#1C1C1C'
  let g:terminal_color_1 = '#EC566E'
  let g:terminal_color_2 = '#4FC73C'
  let g:terminal_color_3 = '#C59E59'
  let g:terminal_color_4 = '#4C7191'
  let g:terminal_color_5 = '#935A83'
  let g:terminal_color_6 = '#5F9492'
  let g:terminal_color_7 = '#D9D9D9'
  let g:terminal_color_8 = '#636363'
  let g:terminal_color_9 = '#AF5B56'
  let g:terminal_color_10 = '#939D69'
  let g:terminal_color_11 = '#C59E59'
  let g:terminal_color_12 = '#87A9C5'
  let g:terminal_color_13 = '#BD82AD'
  let g:terminal_color_14 = '#9EDAD7'
  let g:terminal_color_15 = '#F7F7F7'
  let g:terminal_color_background = '#1E1F21'
  let g:terminal_color_foreground = '#C5C8C7'
  if &background == 'light'
    let g:terminal_color_background = '#282828'
    let g:terminal_color_foreground = '#EBEBEB'
  endif
end

