--[[ local status_ok, lsp = pcall(require, "lspconfig") ]]
--[[ if not status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ require("user.lsp.lsp-installer") ]]
--[[ require("user.lsp.handlers").setup() ]]
--[[ lsp.lua_ls.setup({ ]]
--[[   settings = { ]]
--[[     Lua = { ]]
--[[       runtime = { ]]
--[[         -- Tell the language server which version of Lua you're using ]]
--[[         -- (most likely LuaJIT in the case of Neovim) ]]
--[[         version = "LuaJIT", ]]
--[[       }, ]]
--[[       diagnostics = { ]]
--[[         -- Get the language server to recognize the `vim` global ]]
--[[         globals = { ]]
--[[           "vim", ]]
--[[           "require", ]]
--[[           "pcall", ]]
--[[         }, ]]
--[[       }, ]]
--[[       workspace = { ]]
--[[         -- Make the server aware of Neovim runtime files ]]
--[[         library = vim.api.nvim_get_runtime_file("", true), ]]
--[[       }, ]]
--[[       -- Do not send telemetry data containing a randomized but unique identifier ]]
--[[       telemetry = { ]]
--[[         enable = false, ]]
--[[       }, ]]
--[[     }, ]]
--[[   }, ]]
--[[ }) ]]

local lsp = require("lsp-zero")
local null_ls = require('null-ls')

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})


null_ls.setup({
  sources = {
    -- Replace these with the tools you have installed
    -- make sure the source name is supported by null-ls
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.eslint,
    --[[ null_ls.builtins.formatting.stylua, ]]
  }
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
lsp.configure("ccssmodules_ls", {})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Replace, select = false }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }

  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")


  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>aw", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
