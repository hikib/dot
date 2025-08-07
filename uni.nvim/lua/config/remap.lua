vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader><CR>", "<silent>:noh<CR>:redraw!<CR>")

map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")

-- map <F8> <Esc>:setlocal spell spelllang=de<CR>
-- map <F9> <Esc>:setlocal spell spelllang=en_gb<CR>
-- map <F10> <Esc>:setlocal spell spelllang=da<CR>
-- map <F11> <Esc>:setlocal nospell<CR>

-- netrw
-- map("n", "<leader>dd", ":Lexplore! %:p:h<CR>")
map("n", "<leader>da", ":Lexplore!<CR>")

-- LSP
map("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- navigate buffers
map("n", "<leader>b", ":bdelete<CR>")

-- undo breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "*", "<C-g>u*")

-- cursor positioning
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ'z")

-- diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = 'Open diagnostic float' })

-- yank like D or C
map("n", "Y", "yg_")

-- stay in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better page down and page up
map("n", "<C-j>", "<C-d>")
map("n", "<C-k>", "<C-b>")

-- moving lines
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")

-- clipboard
map("n", "<leader>y", "\"+y")
map("i", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+y")

-- reload source
map("n", "<leader>r", ":source $MYVIMRC<CR>")
