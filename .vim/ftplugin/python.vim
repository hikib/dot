set number
set relativenumber
set textwidth=79
set formatoptions-=c formatoptions-=o formatoptions-=r
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
set encoding=utf-8

" indentation
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

" highlighting
syntax on
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /^\t\+/
match BadWhitespace /\s\+$/
set showmatch

