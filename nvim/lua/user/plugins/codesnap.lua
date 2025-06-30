return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "v", desc = "Save selected code snapshot into clipboard" },
    {
      "<leader>ca",
      "<cmd>CodeSnapASCII<cr>",
      mode = "v",
      desc = "Save selected code snapshot into clipboard as ASCII",
    },
    {
      "<leader>ch",
      "<cmd>CodeSnapHighlight<cr>",
      mode = "v",
      desc = "Save selected code snapshot into clipboard with highlighed codeblock",
    },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "v", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "summer",
    watermark = "",
    border = "rounded",
  },
}
