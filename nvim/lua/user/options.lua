local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = false,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",
  background = "dark",
  guicursor = "n-v-c-i:block",
  autoindent = true,
  textwidth = 80,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.opt.laststatus = 3 -- global status line

--[[ Spelling mistakes will be colored up red. ]]
vim.cmd("hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f")
vim.cmd("hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f")
vim.cmd("hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f")
vim.cmd("hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f")

local augroup = vim.api.nvim_create_augroup
HemanthGroup = augroup("Hemanth", {})
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})
