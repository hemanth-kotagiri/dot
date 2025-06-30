-- return {
--   "folke/trouble.nvim",
--   jependencies = { "nvim-tree/nvim-web-devicons" },
--   cmd = "Trouble",
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--     --
--   },
--   config = function()
--     vim.keymap.set("n", "<leader>xx", function()
--       require("trouble").toggle()
--     end)
--     vim.keymap.set("n", "<leader>xw", function()
--       require("trouble").open("workspace_diagnostics")
--     end)
--     vim.keymap.set("n", "<leader>xd", function()
--       require("trouble").open("document_diagnostics")
--     end)
--     vim.keymap.set("n", "<leader>xq", function()
--       require("trouble").open("quickfix")
--     end)
--     vim.keymap.set("n", "<leader>xl", function()
--       require("trouble").open("loclist")
--     end)
--     vim.keymap.set("n", "gR", function()
--       require("trouble").open("lsp_references")
--     end)
--
--     vim.keymap.set("n", "<leader><leader>", ":FZF<CR>")
--   end,
-- }

return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>gr",
      "<cmd>Trouble lsp_references toggle focus=true win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
