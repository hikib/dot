" if exists("b:current_syntax")
"   finish
" endif

" start in GOYO

autocmd VimEnter * :Goyo

syn spell toplevel
syn case ignore
syn sync linebreaks=1

" TURN OFF POLYGLOT
" syntax match mdTitle "^#.*$"
syntax region mdHeading start="^\s*#" end="$"
syntax region mdSubHeading start="^\s*##" end="$"
syntax match Normal "^\*" conceal cchar=●
" syntax match Normal "^\*" conceal cchar=●
let b:current_syntax = "markdown"

" hi mdTitle cterm=bold guibg=NONE ctermfg=220 guifg=#ffd700 "rgb=255,215,0
" hi mdBold cterm=bold guibg=NONE

" hi mdHeading cterm=underline,bold ctermfg=White
hi mdHeading cterm=bold guibg=NONE ctermfg=221 guifg=#ffd75f "rgb=255,215,95
hi mdSubHeading cterm=bold ctermfg=White
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" syn region markdownLinkText matchgroup=markdownLinkTextDelimiter
"     \ start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@="
"     \ nextgroup=markdownLink,markdownId skipwhite
"     \ contains=@markdownInline,markdownLineStart
"     \ concealends

" hi Normal ctermfg=Gray
" hi Keyword ctermfg=Gray
" hi mdHeading cterm=bold guibg=NONE ctermfg=221 guifg=#ffd75f "rgb=255,215,95
" hi mdSubHeading ctermfg=215	guifg=#ffaf5f	"rgb=255,175,95
" hi Label ctermfg=Gray
" hi Operator ctermfg=57 guifg=#875fd7 guibg=NONE
" hi Repeat ctermfg=57 guifg=#875fd7 guibg=NONE
" hi Special ctermfg=57 guifg=#875fd7 guibg=NONE
" hi SpecialChar ctermfg=57 guifg=#875fd7 guibg=NONE
" hi SpecialComment ctermfg=57 guifg=#875fd7 guibg=NONE

" ctermfg=214	guibg=NONE	guifg=#ffaf00	"rgb=255,175,0


