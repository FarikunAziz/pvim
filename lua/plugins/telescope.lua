local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
}

function M.config()
  local wk = require "which-key"
  local icons = require "user.icons"
  local actions = require "telescope.actions"
  local builtin = require('telescope.builtin')
  local action_state = require('telescope.actions.state')

  --delete buffer
  local buffer_searcher
  buffer_searcher = function()
    builtin.buffers {
      sort_mru = true,
      ignore_current_buffer = true,
      show_all_buffers = false,
      attach_mappings = function(prompt_bufnr, map)
        local refresh_buffer_searcher = function()
          actions.close(prompt_bufnr)
          vim.schedule(buffer_searcher)
        end
        local delete_buf = function()
          local selection = action_state.get_selected_entry()
          vim.api.nvim_buf_delete(selection.bufnr, { force = true })
          refresh_buffer_searcher()
        end
        local delete_multiple_buf = function()
          local picker = action_state.get_current_picker(prompt_bufnr)
          local selection = picker:get_multi_selection()
          for _, entry in ipairs(selection) do
            vim.api.nvim_buf_delete(entry.bufnr, { force = true })
          end
          refresh_buffer_searcher()
        end
        map('n', 'dd', delete_buf)
        map('n', '<C-d>', delete_multiple_buf)
        map('i', '<C-d>', delete_multiple_buf)
        return true
      end
    }
  end
  vim.keymap.set('n', '<leader>fb', buffer_searcher, {})

  wk.register {
    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  }

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
