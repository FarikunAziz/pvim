local M = {
  "folke/which-key.nvim",
}

function M.config()
  local wk = require "which-key"

  local setup = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "none",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = true,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    b = {
      name = "Buffers",
      ['1'] = {'<cmd>bn<cr>','spc + bn = buf next'},
      ['2'] = {'<cmd>bp<cr>','spc + bp = buf prev'},
      ['3'] = {'<cmd>b<cr>','spc + b = buf next'},
      ['4'] = {'<cmd>p<cr>','spc + p = buf next'},
      ['5'] = {"<cmd>buffers<CR>:buffer<Space>",'spc + bl = buf selct'},
    },

    f = { name = "Find" },
    s = { name = "LSP" },
    j = {'spc + j = first word'},
    l = {'spc + l = last word'},

    q = {
      name = "more",
     q = { "<cmd>confirm q<CR>", "Quit" },
     ['1'] = {"<cmd>bdelete<cr>","shift + q = del buffer"}
    },

    h = { "<cmd>nohlsearch<CR>", "NOHL" },

    --group, isi gen yiyang de content
    t = {
      name = "Tab",
      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },

    g = {name = "Gitsigns"}
  }

  wk.setup(setup)
  wk.register(mappings,opts)
end

return M
