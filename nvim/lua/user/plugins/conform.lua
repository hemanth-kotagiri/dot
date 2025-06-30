local formatters_by_ft = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  yaml = { "yamlfmt" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascriptreact = { "prettier" },
  javascript = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettierd" },
  typescriptreact = { "prettierd" },
  vue = { "prettierd" },
}

return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {
    format_after_save = function(bufnr)
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match "/node_modules/" then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters_by_ft = formatters_by_ft,
  },
}
