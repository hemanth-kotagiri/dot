local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
 ]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", ft = "markdown" })
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  use({
    "mattn/emmet-vim",
    ft = { "html", "css", "markdown", "typescriptreact", "javascriptreact" },
  })
  use("nvim-lualine/lualine.nvim")
  use("lewis6991/impatient.nvim")
  use("akinsho/toggleterm.nvim")
  use("max397574/better-escape.nvim")
  use({
    "windwp/nvim-ts-autotag",
    ft = { "html", "css", "markdown", "typescriptreact", "javascriptreact" },
  })
  use("numToStr/Navigator.nvim")
  use("akinsho/bufferline.nvim")
  use({ "RishabhRD/nvim-cheat.sh" })
  use("RishabhRD/popfix")
  use("nvim-treesitter/nvim-treesitter-context")
  use("mfussenegger/nvim-dap")
  use("xiyaowong/nvim-transparent")
  use("RRethy/vim-illuminate")
  use({
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  })
  use("camgraff/telescope-tmux.nvim")
  use "lukas-reineke/indent-blankline.nvim"

  -- Colorschemes
  use({
    "rose-pine/neovim",
    as = "rose-pine",
  })
  use("tiagovla/tokyodark.nvim")
  use("marko-cerovac/material.nvim")
  use("folke/tokyonight.nvim")
  use("dylanaraps/wal.vim")
  use("ellisonleao/gruvbox.nvim")
  use("rebelot/kanagawa.nvim")
  use("nanotech/jellybeans.vim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
  use("kyazdani42/blue-moon")
  use("tjdevries/colorbuddy.vim")
  use("RishabhRD/nvim-rdark")
  use("norcalli/nvim-colorizer.lua")
  use("lunarvim/lunar.nvim")
  use("lunarvim/darkplus.nvim")
  use({
    "mrshmllow/document-color.nvim",
    config = function()
      require("document-color").setup({
        -- Default options
        mode = "background", -- "background" | "foreground" | "single"
      })
    end,
  })
  use("tjdevries/gruvbuddy.nvim")
  use("sam4llis/nvim-tundra")
  use("rafamadriz/neon")
  use("https://gitlab.com/madyanov/gruber.vim")
  use("ishan9299/nvim-solarized-lua")
  use("luisiacc/gruvbox-baby")
  use("ray-x/aurora")
  use("Shatur/neovim-ayu")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use("nvim-telescope/telescope-github.nvim")
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use("gaelph/logsitter.nvim")

  -- Commenting
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  use "sindrets/diffview.nvim"
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }

  -- Nvim-Tree
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("glacambre/firenvim")

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
