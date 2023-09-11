return {
  "danymat/neogen",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('neogen').setup {
      snippet_engine = "luasnip"
    }
  end,
}
