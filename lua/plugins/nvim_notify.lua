local M = {
  'rcarriga/nvim-notify',
  event = "VeryLazy"
}

function M.config()
  local nvim_notify = require("notify")
  nvim_notify.setup {
    -- Animation style
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 1500,
    background_colour = "#2E3440",
  }

  vim.notify = nvim_notify
end

return M
