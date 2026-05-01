local M = {
  "numToStr/Comment.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}

function M.config()
  vim.g.skip_ts_context_commentstring_module = true
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment" },
  }
  wk.add {
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment", mode = "v" },
  }
end

return M
