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
keymap("n", "//", ":noh<cr>", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "J", "maJ`a", opts)

-- Panes --
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<F5>", ":setlocal spell!<CR>", opts)
keymap("n", "<leader>db", ":bdelete<CR>", opts)

-- Leader Keymaps
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>m", ":MarkdownPreviewToggle<cr>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.format({async = true})<cr>", opts)
keymap("n", "<leader><CR>", ":so %<CR>", opts)
keymap("n", "<leader>rl", ":edit<CR>", opts)
keymap("n", "<leader>|", "<C-w>|<CR>", opts)
keymap("n", "<leader>=", "<C-w>=<CR>", opts)
keymap("n", "<leader>tt", ":TransparentToggle<CR>", opts)
keymap("n", "<leader>lg", "ma:Logsitter<CR>", opts)
--[[ vim.cmd("nnoremap <leader>lg ma:silent put=['console.log(\"<C-r><C-w>\", <C-r><C-w>);']<CR>-2==+`a") ]]

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

-- Gitsigns --
keymap("n", "]]", "<cmd>Gitsigns next_hunk<cr>", term_opts)
keymap("n", "[[", "<cmd>Gitsigns prev_hunk<cr>", term_opts)

-- Telescope --
keymap("n", "<C-f>", "<cmd>Telescope find_files hidden=true<cr>", term_opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", term_opts)
keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", term_opts)
keymap("n", "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", term_opts)
keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", term_opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", term_opts)
keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", term_opts)
keymap("n", "<leader>bc", "<cmd>Telescope git_bcommits<cr>", term_opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", term_opts)
keymap("n", "<leader>pr", "<cmd>Telescope gh pull_request<cr>", term_opts)
keymap("n", "<leader>pf", "<cmd>Telescope gh pull_request_files<cr>", term_opts)
keymap("n", "<leader>qf", "<cmd>Telescope quickfix<cr>", term_opts)
keymap("n", "<leader>qh", "<cmd>Telescope quickfixhistory<cr>", term_opts)
keymap("n", "<leader>tw", "<cmd>Telescope tmux windows<cr>", term_opts)
keymap("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", term_opts)


-- CHEAT --
keymap("n", "<leader>c", "<cmd>Cheat<cr>", term_opts)

-- Emmet Config --
-- vim.cmd 'let g:user_emmet_install_global = 0'
-- vim.cmd 'autocmd FileType html,css,jsx,tsx EmmetInstall'
vim.cmd("let g:user_emmet_leader_key=','")
