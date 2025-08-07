local M = {
  "nvim-lualine/lualine.nvim",
  commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = {"InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}


function M.config()
  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local colors = {
    '#202328','#bbc2cf','#74512D','#0A6847','#FF0080',
    '#6C946F','#FFA823','#DC0083','#EB5B00','#E4003A',
    '#4535C1','#50B498','#FF7EE2','#1A5319','#4A249D',
    '#009FBD','#FF4191','#E76F51','#37B7C3','#06D001',
    '#0C1844','#FFDE95','#E88D67','#373A40','#FF0000',
    '#FAEF5D','#E26EE5','#54B435'
  }

  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors[2], bg = colors[1] } },
        inactive = { c = { fg = colors[2], bg = colors[1] } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return '▊'
    end,
    color = {fg = colors[16]},
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return ''
    end,
    padding = { right = 1 },
  }

  ins_left { 'mode'}

  ins_left { 'location' }

  ins_left { 'progress',
    color = function ()
      local mode_color = {
        n = colors[26],
        i = colors[12],
        v = colors[4],
      }
      return {fg = mode_color[vim.fn.mode()], gui = 'bold'}
    end
  }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ', hint = ' '},
    diagnostics_color = {
      color_error = { fg = colors[25] },
      color_warn = { fg = colors[9] },
      color_info = { fg = colors[5] },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = function ()
      local mode_color = {
        n = colors[19],
        i = colors[27],
        v = colors[3],
      }
      return {fg = mode_color[vim.fn.mode()]}
    end
  }

  ins_right {
    function ()
      return "⌥ : ".. vim.api.nvim_get_option_value('shiftwidth', {})
    end
  }

  ins_right {
    "os.date('%H:%M')",
  }

  ins_right {
    'branch',
    color = function ()
      local mode_color = {
        n = colors[20],
        i = colors[10],
        v = colors[26],
      }
      return {fg = mode_color[vim.fn.mode()]}
    end
  }

  require('lualine').setup(config)
end

return M
