vim.g.mapleader = " "
vim.keymap.set("n", "<leader><CR>", "<silent>:noh<CR>:redraw!<CR>")
-- map <F8> <Esc>:setlocal spell spelllang=de<CR>
-- map <F9> <Esc>:setlocal spell spelllang=en_gb<CR>
-- map <F10> <Esc>:setlocal spell spelllang=da<CR>
-- map <F11> <Esc>:setlocal nospell<CR>

-- netrw
vim.keymap.set("n", "<leader>dd", ":Lexplore! %:p:h<CR>")
vim.keymap.set("n", "<Leader>da", ":Lexplore!<CR>")

-- LSP
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

-- navigate buffers
vim.keymap.set("n", "<leader>p", ":bprevious<CR>")
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>b", ":bdelete<CR>")

-- undo breakpoints
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")
vim.keymap.set("i", "*", "<C-g>u*")

-- cursor positioning
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ'z")

-- yank like D or C
vim.keymap.set("n", "Y", "yg_")

-- stay in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- better page down and page up
vim.keymap.set("n", "<C-j>", "<C-d>")
vim.keymap.set("n", "<C-k>", "<C-b>")

-- moving lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("i", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- reload source
vim.keymap.set("n", "<leader>r", ":source $MYVIMRC<CR>")
