local M = {
  "nvim-lualine/lualine.nvim",
  commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = {"InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}


function M.config()
  local spaces = function()
      return "⌥ : ".. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      -- lualine_a = {
      -- { 'mode',
      --   separator = { left = ''}, right_padding = 2 },
      -- },
      lualine_a = {'mode','location'},
      lualine_b = {'progress','diagnostics'},
      lualine_c = {},
      lualine_x = {spaces},
      lualine_y = {"os.date('%a, %b %d  %H:%M')"},
      lualine_z = {'branch'},
      -- lualine_z = {
      --   { 'progress', separator = { right = ''}, left_padding = 2 },
      -- },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {'location'},
      lualine_c = {'encoding'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'diff'},
    },
    tabline = {},
    extensions = {},
  }
end

return M
