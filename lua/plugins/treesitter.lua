local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
