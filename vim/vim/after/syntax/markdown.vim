" if exists("b:current_syntax")
"   finish
" endif

" START IN GOYO
autocmd VimEnter * :Goyo

set spelllang=en
set nospell

syn spell toplevel
syn case ignore
syn sync linebreaks=1

let b:current_syntax = "markdown"
syntax region mdHeading start="^\s*#" end="$"
syntax match Normal "^\*" conceal cchar=●



hi mdHeading ctermfg=180
" hi mdHeading ctermfg=255
