" Behaviour
set nocompatible		" Use Vim settings, not Vi
set backspace=indent,eol,start	" Allow backspacing over everything
set autoindent
set history=50
set ruler			" Show the cursor position all the time
set showcmd			" Display incomplete commands
set incsearch			" Do incremental searching
set nobackup

" Filetypes
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

if !exists("autocmds_loaded")
    let autocmds_loaded = 1
    autocmd FileType scheme set lisp comments=n:; shiftwidth=2
    autocmd FileType lisp   set lisp comments=n:; shiftwidth=2
    autocmd FileType java   set cindent
    autocmd FileType cpp    set cindent
    autocmd FileType c      set cindent
    autocmd FileType ruby   set shiftwidth=2 tabstop=2 expandtab
    autocmd FileType eruby  set shiftwidth=2 tabstop=2 expandtab
    autocmd FileType make   set shiftwidth=8 noexpandtab nosmarttab
endif

" Looks
set title			" Set a nice title
set titleold=''			" Reset the title
set laststatus=2
set showmode
autocmd BufNewFile,BufRead,BufEnter * let &titlestring = expand("`hostname -s`") . ": " . expand("%:t") . " " . "(" . expand("%:p") . ")"
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ %c%V\ %l\,%L\ %P
"

" If terminal has colors, or GUI
if &t_Co > 2 || has("gui_running")
	syntax on
endif
