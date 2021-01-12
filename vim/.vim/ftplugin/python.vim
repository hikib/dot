set number
set relativenumber
set formatoptions-=c formatoptions-=o formatoptions-=r
set encoding=utf-8

" indentation
set ts=4
set autoindent
set shiftwidth=4
set softtabstop=4
set smarttab

" highlighting
syntax on
let python_highlight_all=1
set showmatch

" Run python files
inoremap <F5> <ESC>:w<CR>:!python3 %<CR>
nnoremap <F5> :w<CR>:!python3 %<CR>
