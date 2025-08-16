local T = {
  "folke/twilight.nvim",
}

function T.config()
  require('twilight').setup{
    dimming = {
      alpha = 0.13,

      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 11,
    treesitter = true,


    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {"txt","md"},
  }
end

return T
