-- return {
--   "max397574/better-escape.nvim",
--   config = function()
--     local escape = require("better_escape")
--     --   escape.setup({
--     --     -- mapping = { "jk" },         -- a table with mappings to use
--     --     -- timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
--     --     -- clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
--     --     -- keys = "<Esc>",          -- keys used for escaping, if it is a function will use the result everytime
--     --     -- example(recommended)
--     --     -- keys = function()
--     --     --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
--     --     -- end,
--     --     k = function()
--     --       vim.api.nvim_input("j")
--     --       local current_line = vim.api.nvim_get_current_line()
--     --       if current_line:match("^%s+j$") then
--     --         vim.schedule(function()
--     --           vim.api.nvim_set_current_line("")
--     --         end)
--     --       end
--     --     end,
--     --   })
--     -- end,
--     escape.setup({
--       timeout = 10,
--       default_mappings = false,
--       mappings = {
--         i = {
--           j = {
--             -- These can all also be functions
--             k = "<Esc>",
--           },
--         },
--       },
--     })
--   end,
-- }
-- lua with lazy.nvim
return {
  "max397574/better-escape.nvim",
  config = function()
    -- lua, default settings
    require("better_escape").setup({
      timeout = 10,
      default_mappings = true,
      mappings = {
        i = {
          j = {
            -- These can all also be functions
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<C-\\><C-n>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    })
  end,
}
