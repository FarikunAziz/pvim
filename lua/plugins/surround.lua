return {
  "echasnovski/mini.surround",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({

      mappings = {
        add = "sa",
        delete = "sd",
        replace = "sr",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        update_n_lines = "sn",
      },

      highlight_duration = 500,

      search_method = "cover_or_next",

      respect_selection_type = true,
    })

    vim.opt.timeoutlen = 2000

    local map = vim.keymap.set
    map("n", "<leader>bi", "saiw?***<CR>***<CR>", { remap = true, silent = true, desc = "Wrap word in Bold Italic" })
    map("n", "<leader>bo", "saiw?**<CR>**<CR>", { remap = true, silent = true, desc = "Wrap word in Bold" })
    map("n", "<leader>i", "saiw_", { remap = true, silent = true, desc = "Wrap word in Italic" })
  end,
}
