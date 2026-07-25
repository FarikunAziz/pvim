local M = {
  'MeanderingProgrammer/render-markdown.nvim',
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require('render-markdown').setup({
    render_modes = true,

    heading = {
      enabled = true,
      sign = false,
      icons = { "❯ ", "❯❯ ", "❯❯❯ ", "❯❯❯❯ ", "❯❯❯❯❯ ", "❯❯❯❯❯❯ " },

      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
    },

    code = {
      enabled = true,
      sign = false,
      style = "full",
      position = "left",
      width = "block",
      left_pad = 2,
      right_pad = 4,
      border = "thin",
      above = "▄",
      below = "▀",
      highlight = "RenderMarkdownCode",
    },

    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      left_pad = 0,
      right_pad = 1,
    },

    checkbox = {
      enabled = true,
      custom = {
        todo = { raw = "[-]", rendered = "   ", highlight = "RenderMarkdownTodo" },
      },
      unchecked = { icon = "   ", highlight = "RenderMarkdownUnchecked" },
      checked = { icon = "   ", highlight = "RenderMarkdownChecked" },
    },

    link = {
      enabled = true,
      image = "   ",
      email = "   ",
      hyperlink = "   ",
      highlight = "RenderMarkdownLink",
    },

    dash = {
      enabled = true,
      icon = "─",
      width = "full",
      highlight = "RenderMarkdownDash",
    },
  })
end

return M

