local M = {
  "lewis6991/gitsigns.nvim",
  event = {"BufReadPost", "BufNewFile"},
  cmd = "Gitsigns",
}

M.config = function()
  local icons = require "user.icons"

  local wk = require "which-key"
  wk.add {
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git diffthis" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame line" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  }

local keymap = vim.keymap.set
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Lompat ke Baris Berikutnya" })
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Lompat ke Baris Sebelumnya" })

  require("gitsigns").setup {
    signs = {
      add = {text = icons.ui.BoldLineMiddle},
      change = {text = icons.ui.BoldLineDashedMiddle},
      delete = {text = icons.ui.TriangleShortArrowRight},
      topdelete = {text = icons.ui.TriangleShortArrowRight},
      changedelete = {text = icons.ui.BoldLineMiddle},
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }
end

return M
