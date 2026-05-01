return {
  "kevinhwang91/nvim-ufo",
  dependencies = {"kevinhwang91/promise-async","luukvbaal/statuscol.nvim"},
  event = "BufReadPost",

  config = function()
    local statuscol = require("statuscol")
    local builtin = require("statuscol.builtin")

    vim.opt.signcolumn = "yes"

    vim.opt.fillchars = {
      foldopen = "",
      foldclose = "",
      fold = " ",
      foldsep = " ",
    }

    statuscol.setup({
      relculright = true,
      segments = {
        {
          text = {"%s"},
          maxwidth = 2,
          colwidth = 2,
          auto = false,
          click = "v:lua.ScSa",
        },
        {
          text = { builtin.foldfunc},
          click = "v:lua.ScFa",
          hl = "Comment",
        },
        {
          text = {" ", builtin.lnumfunc, " " },
          click = "v:lua.ScLa",
        },
      },
    })

    local handler = function(virtText, lnum, endLnum, width, truncate)

      local newVirtText = {}
      local suffix = ("     %d lines folded "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, { chunkText, chunk[2] })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    require("ufo").setup({
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })

    vim.keymap.set("n", "zr", require("ufo").openAllFolds, { desc = "open all folding" })
    vim.keymap.set("n", "zm", require("ufo").closeAllFolds, { desc = "close all folding" })
  end
}
