local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
  event = "VeryLazy",
}

vim.g.indentLine_char = "╎"

function M.config()
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
  }
end

return M
