local M = {
  'NvChad/nvim-colorizer.lua',
  lazy = true,
  ft = { "css", "javascript", "html" }
}

function M.config()
  require('colorizer').setup({
    filetypes = {
      'css',
      'javascript',
      'html',
    },
    user_default_options = {
      mode = "background",
      css = { rgb_fn = true },
      html = { names = false },
    },
  })
end

return M

