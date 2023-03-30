local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- REFERENCE
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<F5>", ":setlocal spell!<CR>", opts)
keymap("n", "<leader>db", ":bdelete<CR>", opts)

-- Leader Keymaps
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>m", ":MarkdownPreviewToggle<cr>", opts)
keymap("n", "//", ":noh<cr>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.format({async = true})<cr>", opts)
keymap("n", "<leader><CR>", ":so %<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv ", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv ", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<C-f>", "<cmd>Telescope find_files hidden=true<cr>", term_opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", term_opts)
keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", term_opts)
keymap("n", "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", term_opts)
keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", term_opts)

-- CHEAT --
keymap("n", "<leader>c", "<cmd>Cheat<cr>", term_opts)

-- Emmet Config --
-- vim.cmd 'let g:user_emmet_install_global = 0'
-- vim.cmd 'autocmd FileType html,css,jsx,tsx EmmetInstall'
vim.cmd("let g:user_emmet_leader_key=','")
