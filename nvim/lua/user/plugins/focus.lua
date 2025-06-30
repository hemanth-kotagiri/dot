return {
  "nvim-focus/focus.nvim",
  version = false,
  config = function()
    local focus = require("focus")
    focus.setup({ autoresize = { focusedwindow_minwidth = 120, height_quickfix = 10 } })
  end,
}
