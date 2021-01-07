" Spelling -> ctrl+l for auto correct
" if 'word list' not found, type:
"   1. :set nospell
"   2. :set spell
"   3. confirm download
setlocal spell
set spelllang=da,en_gb


set linebreak

let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_method= 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : './output/',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-pdf',
    \ ],
    \}

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-pdf',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
" Clientserver is necessary for backward search from PDF viewer to Vim
" if empty(v:servername) && exists('*remote_startserver')
" 	call remote_startserver('VIM')
" endif

