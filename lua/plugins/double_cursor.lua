return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    vim.keymap.set({"n", "v"}, "<M-Down>", function() mc.lineAddCursor(1) end)
    vim.keymap.set({"n", "v"}, "<M-Up>", function() mc.lineAddCursor(-1) end)

    vim.keymap.set({"n", "v"}, "<C-n>", function()
      if vim.fn.mode() == "n" then
        vim.cmd("normal! viw")
      end
      mc.matchAddCursor(1)
    end)
    --hapus 1 seleksi
    vim.keymap.set({"n", "v"}, "<C-p>", function() mc.matchAddCursor(-1) end)

    vim.keymap.set({"n", "v"}, "<C-x>", function()
      if vim.fn.mode() == "n" then
        vim.cmd("normal! viw")
      end
      mc.matchSkipCursor(1)
    end)

    vim.keymap.set("n", "<Esc>", function()
      if mc.hasCursors() then
        mc.clearCursors()
      else
        vim.cmd("noh")
      end
    end)
  end
}

