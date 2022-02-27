" if exists("b:current_syntax")
"   finish
" endif

" START IN GOYO
autocmd VimEnter * :Goyo
set spell
set spelllang=en

syn spell toplevel
syn case ignore
syn sync linebreaks=1

" syntax region mdHeading start="^\s*#" end="$"
" syntax region mdSubHeading start="^\s*##" end="$"
syntax match Normal "^\*" conceal cchar=●
let b:current_syntax = "markdown"

" hi mdHeading cterm=bold ctermfg=11
" hi mdHeading cterm=NONE ctermfg=173
" hi mdHeading cterm=bold ctermfg=173
" hi mdSubHeading cterm=bold ctermfg=White
" hi mdSubHeading cterm=NONE
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

