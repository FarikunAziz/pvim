local M = {
  "akinsho/toggleterm.nvim",
  -- event = "VeryLazy",
  keys = { "<M-1>", "<M-2>", "<M-3>", "<c-\\>" },
}

function M.config()
  local toggleterm = require("toggleterm")
  local Terminal = require("toggleterm.terminal").Terminal

  local function compute_size(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.3
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end

  require("toggleterm").setup {
    size = compute_size,
    open_mapping = [[<c-\>]],
    hide_numbers = true, 
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, 
    start_in_insert = true,
    insert_mappings = true, 
    persist_size = false,
    direction = "float",
    close_on_exit = true, 
    shell = nil, 
    float_opts = {
      border = "rounded",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.count
      end,
    },
  }

  local function toggle_custom(id, dir)
    local term = Terminal:new({ count = id, direction = dir })
    term:toggle()
  end

  vim.keymap.set({ "n", "t" }, "<M-1>", function() toggle_custom(101, "horizontal") end, { desc = "Horizontal Term" })
  vim.keymap.set({ "n", "t" }, "<M-2>", function() toggle_custom(102, "vertical") end, { desc = "Vertical Term" })
  vim.keymap.set({ "n", "t" }, "<M-3>", function() toggle_custom(103, "float") end, { desc = "Float Term" })

  vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("TerminalSetup", { clear = true }),
    callback = function()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.keymap.set("t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.keymap.set("t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.keymap.set("t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
      vim.cmd("startinsert")
    end,
  })
end

return M
