return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",

    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "camgraff/telescope-tmux.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      builtins = {
        find_files = {
          path_display = { "absolute" },
        },
      },
      defaults = {
        entry_prefix = "  ",
        multi_icon = "<>",

        -- path_display = "truncate",

        winblend = 0,
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.95,
          height = 0.85,
          -- preview_cutoff = 120,
          prompt_position = "top",

          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },

          vertical = {
            width = 0.9,
            height = 0.95,
            preview_height = 0.5,
          },

          flex = {
            horizontal = {
              preview_width = 0.9,
            },
          },
        },

        selection_strategy = "reset",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        color_devicons = true,
        prompt_prefix = "> ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", "venv", ".git" },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        colorshemes = {
          preview = true,
        },
        lsp_code_actions = {
          theme = "dropdown",
        },
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            -- even more opts
          }),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("gh")
    telescope.load_extension("tmux")

    local git_hunks = function()
      require("telescope.pickers")
        .new({
          finder = require("telescope.finders").new_oneshot_job({ "git", "jump", "--stdout", "diff" }, {
            entry_maker = function(line)
              local filename, lnum_string = line:match("([^:]+):(%d+).*")

              -- I couldn't find a way to use grep in new_oneshot_job so we have to filter here.
              -- return nil if filename is /dev/null because this means the file was deleted.
              if filename:match("^/dev/null") then
                return nil
              end

              return {
                value = filename,
                display = line,
                ordinal = line,
                filename = filename,
                lnum = tonumber(lnum_string),
              }
            end,
          }),
          sorter = require("telescope.sorters").get_generic_fuzzy_sorter(),
          previewer = require("telescope.config").values.grep_previewer({}),
          results_title = "Git hunks",
          prompt_title = "Git hunks",
          layout_strategy = "flex",
        }, {})
        :find()
    end

    local keymap = vim.keymap.set
    local term_opts = { silent = true }

    keymap("n", "<Leader>gh", git_hunks, {})
    keymap("n", "<C-f>", "<cmd>Telescope git_files hidden=true<cr>", term_opts)
    keymap("n", "<C-p>", "<cmd>Telescope find_files hidden=true<cr>", term_opts)
    keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", term_opts)
    keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", term_opts)
    keymap("n", "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", term_opts)
    keymap("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", term_opts)
    keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", term_opts)
    keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", term_opts)
    keymap("n", "<leader>bc", "<cmd>Telescope git_bcommits<cr>", term_opts)
    keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", term_opts)
    keymap("n", "<leader>pr", "<cmd>Telescope gh pull_request<cr>", term_opts)
    keymap("n", "<leader>pf", "<cmd>Telescope gh pull_request_files<cr>", term_opts)
    keymap("n", "<leader>qf", "<cmd>Telescope quickfix<cr>", term_opts)
    keymap("n", "<leader>qh", "<cmd>Telescope quickfixhistory<cr>", term_opts)
    keymap("n", "<leader>tw", "<cmd>Telescope tmux windows<cr>", term_opts)
    keymap("n", "<leader>td", "<cmd>Telescope diagnostics<cr>", term_opts)
  end,
}
