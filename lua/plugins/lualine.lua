local M = {
  "nvim-lualine/lualine.nvim",
  event = {"InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}


function M.config()
    local x1 = require 'user.lualine_themes' --kurang berguna untuk saat ini
    local default_themes = require 'lualine.themes.auto'

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
      newfile_statue = true,
      symbols = {
        modified = '󰚼 ',
        readonly = ' ',
        unnamed = '󰺴 ',
        newfile = ' ',
      }
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      diagnostics_color = {
        error = {fg = '#8C1007'},
        warn  = {fg = '#FFC900'},
        info  = {fg = '#568F87'},
        hint  = {fg = '#8AA624'},
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      diff_color = {
        added    = 'LuaLineDiffAdd',
        modified = 'LuaLineDiffChange',
        removed  = 'LuaLineDiffDelete',
      },
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = default_themes,
        section_separators = '',
        component_separators = '',
        disabled,iletypes = { 'alpha', 'neo-tree', 'Avante' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { "os.date('%H:%M')", cond = hide_in_width }},
        lualine_y = {},
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
end


return M
