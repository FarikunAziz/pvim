return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    { "<M-Down>", function() require("multicursor-nvim").lineAddCursor(1) end, mode = {"n", "v"}, desc = "Add cursor down" },
    { "<M-Up>", function() require("multicursor-nvim").lineAddCursor(-1) end, mode = {"n", "v"}, desc = "Add cursor up" },

    {
      "<C-n>", function()
        local mc = require("multicursor-nvim")
        if vim.fn.mode() == "n" then
          vim.cmd("normal! viw")
        end
        mc.matchAddCursor(1)
      end, mode = {"n", "v"}, desc = "Match add cursor" 
    },

    { "<C-p>", function() require("multicursor-nvim").matchAddCursor(-1) end, mode = {"n", "v"}, desc = "Match remove cursor" },

    {
      "<C-x>", function()
        local mc = require("multicursor-nvim")
        if vim.fn.mode() == "n" then
          vim.cmd("normal! viw")
        end
        mc.matchSkipCursor(1)
      end, mode = {"n", "v"}, desc = "Match skip cursor"
    },
  },
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    vim.keymap.set("n", "<Esc>", function()
      if mc.hasCursors() then
        mc.clearCursors()
      else
        vim.cmd("noh")
      end
    end)
  end
}

