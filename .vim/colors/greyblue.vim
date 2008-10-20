" Vim color file
"

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "greyblue"

hi Normal          ctermfg=grey  ctermbg=NONE gui=NONE guifg=#b7af9f guibg=#090909

" Search
hi IncSearch       ctermfg=NONE  ctermbg=NONE gui=NONE guifg=#C9C9C9 guibg=#70707f
hi Search          ctermfg=white ctermbg=blue gui=NONE guifg=#C9C9C9 guibg=#70707f

" Messages
hi ErrorMsg        ctermfg=white ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi WarningMsg      ctermfg=white ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi ModeMsg         ctermfg=white ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi MoreMsg         ctermfg=white ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE
hi Question        ctermfg=white ctermbg=NONE gui=NONE guifg=#ffffff guibg=NONE

" Split area
hi StatusLine      ctermfg=darkgrey  ctermbg=white gui=BOLD guifg=#e8d5c0 guibg=#404040
hi StatusLineNC    ctermfg=darkgrey  ctermbg=black gui=BOLD guifg=#5f5f4f guibg=#404040
hi VertSplit       ctermfg=darkgrey  ctermbg=black gui=NONE guifg=#5f5f4f guibg=#404040
hi WildMenu        ctermfg=NONE  ctermbg=NONE gui=BOLD guifg=#070707 guibg=#ff5533

" Diff
hi DiffText        cterm=bold  ctermbg=red gui=NONE guifg=#07cfef guibg=#00151f
hi DiffChange      ctermfg=white  ctermbg=magenta gui=NONE guifg=#ff97ff guibg=#2f002f
hi DiffDelete      ctermfg=blue  ctermbg=cyan gui=NONE guifg=#dfdf00 guibg=#370d15
hi DiffAdd         ctermfg=white  ctermbg=darkblue gui=NONE guifg=#dfdf00 guibg=#370d15

" Cursor
hi Cursor          ctermfg=NONE  ctermbg=NONE gui=NONE guifg=NONE    guibg=#80808F
hi lCursor         ctermfg=NONE  ctermbg=NONE gui=NONE guifg=#070707 guibg=#7fff00
hi CursorIM        ctermfg=NONE  ctermbg=NONE gui=NONE guifg=#070707 guibg=#7fff00

" Fold
hi Folded          ctermfg=darkgrey  ctermbg=NONE gui=NONE guifg=#808080 guibg=#222b2e
hi FoldColumn      ctermfg=white  ctermbg=NONE gui=NONE guifg=#559f00 guibg=#0f0f0b

" Other
hi Directory       ctermfg=grey  ctermbg=NONE gui=NONE guifg=#aaaaba guibg=NONE
hi LineNr          ctermfg=darkgrey  ctermbg=NONE gui=NONE guifg=#7f7f5f guibg=NONE
hi NonText         ctermfg=darkgrey  ctermbg=NONE gui=BOLD guifg=#211d1a guibg=#211d1a
hi SpecialKey      ctermfg=red  ctermbg=NONE gui=NONE guifg=#378fff guibg=NONE
hi Title           ctermfg=yellow  ctermbg=NONE gui=NONE guifg=#ffbf9f guibg=#370f07
hi Visual          ctermfg=NONE  ctermbg=NONE gui=NONE guifg=#abadde guibg=#2d2d3a

" Syntax group
hi Comment         ctermfg=darkgrey  ctermbg=NONE gui=BOLD      guifg=#74748a guibg=#252525
hi Constant        ctermfg=darkblue  ctermbg=darkgrey gui=NONE      guifg=#acabc7 guibg=#151515
hi Error           ctermfg=red  ctermbg=NONE gui=NONE      guifg=#00ffff guibg=NONE
hi Identifier      ctermfg=white  ctermbg=NONE gui=NONE      guifg=#94b9aa guibg=NONE
hi Ignore          ctermfg=NONE  ctermbg=NONE gui=NONE      guifg=NONE    guibg=NONE
hi PreProc         ctermfg=NONE  ctermbg=NONE gui=NONE      guifg=#80A090    guibg=NONE
hi Special         ctermfg=blue  ctermbg=NONE gui=NONE      guifg=#aa1565 guibg=NONE
hi Statement       ctermfg=darkmagenta  ctermbg=NONE gui=bold      guifg=#d1bfb1 guibg=NONE
hi Todo            ctermfg=red  ctermbg=grey gui=bold      guifg=#efe469 guibg=#515151
hi Type            ctermfg=white  ctermbg=NONE gui=BOLD      guifg=#707099 guibg=NONE
hi Underlined      ctermfg=green  ctermbg=NONE gui=UNDERLINE guifg=NONE    guibg=NONE

" HTML
hi htmlLink                gui=UNDERLINE guifg=#aa1565 guibg=NONE
hi htmlBold                gui=BOLD
hi htmlBoldItalic          gui=BOLD,ITALIC
hi htmlBoldUnderline       gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic              gui=ITALIC
hi htmlUnderline           gui=UNDERLINE
hi htmlUnderlineItalic     gui=UNDERLINE,ITALIC
