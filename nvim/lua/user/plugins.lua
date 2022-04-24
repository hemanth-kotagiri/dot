local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown' }
  use 'windwp/nvim-autopairs'
  use 'numToStr/Comment.nvim'
  use 'wakatime/vim-wakatime'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use {
    "mattn/emmet-vim",
    ft = { "html", "css", "markdown", "typescriptreact", "javascriptreact" },
  }
  use 'nvim-lualine/lualine.nvim'
  use "lewis6991/impatient.nvim"
  use "akinsho/toggleterm.nvim"
  use "max397574/better-escape.nvim"
  use {
    "windwp/nvim-ts-autotag",
    ft = { "html", "css", "markdown", "typescriptreact", "javascriptreact" },
  }
  use 'numToStr/Navigator.nvim'

  -- Colorschemes
  use "lunarvim/colorschemes"
  use 'tiagovla/tokyodark.nvim'
  use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'
  use 'dylanaraps/wal.vim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'p00f/nvim-ts-rainbow'


  -- Commenting
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Nvim-Tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
