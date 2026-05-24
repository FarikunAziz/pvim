local M = {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>bb", "<cmd>FzfLua buffers winopts={'preview':{'hidden':'hidden'}}<cr>", desc = "Find Buffer" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch" },
    { "<leader>fc", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
    { "<leader>fl", "<cmd>FzfLua resume<cr>", desc = "Last Search" },
    { "<leader>fp", "<cmd>FzfLua profiles<cr>", desc = "Projects" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent File" },
    { "<leader>ft", "<cmd>FzfLua live_grep_native<cr>", desc = "Find Text" },
  },
}

M.init = function()
  vim.ui.select = function(...)
    require("fzf-lua").register_ui_select()
    return vim.ui.select(...)
  end
end

M.config = function()
  local fzf = require("fzf-lua")
  fzf.setup({
    fzf_opts = {
      ["--layout"] = "reverse",
      ["--info"] = "inline-right",
    },

    winopts = {
      height = 0.85,
      width = 0.90,
      border = "single",
      preview = {
        layout = "horizontal",
        vertical = "right:55%",
        border = "noborder"
      },
    },

    files = { formatter = "path.filename_first" },
  })

end

return M
