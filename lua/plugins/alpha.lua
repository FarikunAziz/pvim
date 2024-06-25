local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local alpha = require "alpha"
  local startify = require "alpha.themes.startify"

  startify.section.header.val = {
    " ███████ ███████ ███    ██ ███████ ███████ ██ ",
    " ██      ██      ████   ██ ██      ██      ██ ",
    " ███████ █████   ██ ██  ██ ███████ █████   ██ ",
    "      ██ ██      ██  ██ ██      ██ ██      ██ ",
    " ███████ ███████ ██   ████ ███████ ███████ ██ ",
  }

  vim.cmd[[autocmd User AlphaReady echo 'Farikun Aziz']]
  
  alpha.setup(startify.config)
end

return M
