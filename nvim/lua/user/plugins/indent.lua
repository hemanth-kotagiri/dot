return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufEnter" },
  config = function() 
    vim.opt.list = true
    local indent_blankline = require("indent_blankline")
    indent_blankline.setup {
      show_current_context = true,
    }
  end
}
