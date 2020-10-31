" Spelling -> ctrl+l for auto correct
" if 'word list' not found, type:
"   1. :set nospell
"   2. :set spell
"   3. confirm download
setlocal spell
set spelllang=da,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set linebreak

" Plug tex-conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" Clientserver is necessary for backward search from PDF viewer to Vim
if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif
