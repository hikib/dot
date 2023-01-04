let mapleader = ' '
nnoremap <silent> <leader><CR> :noh<CR>:redraw!<CR>
map <F8> <Esc>:setlocal spell spelllang=de<CR>
map <F9> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F10> <Esc>:setlocal spell spelllang=da<CR>
map <F11> <Esc>:setlocal nospell<CR>

" netrw
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

" navigate buffers
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>d :bdelete<CR>

" undo breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap * <C-g>u*

" cursor positioning
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" yank like D or C
nnoremap Y yg_

" stay in visual mode
vnoremap < <gv
vnoremap > >gv

" better page down and page up
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-b>

" moving lines
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" reload source
nnoremap <leader>r :source $MYVIMRC<CR>
