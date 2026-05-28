local M = {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
}

function M.config()
  local icon = require "user.icons"

  require("blink.cmp").setup({

    snippets = {
      preset = "default",
    },

    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        draw = {
          columns = {
            { "kind_icon", "kind", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "source_name" }
          },

          components = {
            source_name = {
              text = function(ctx)
                local source_labels = {
                  lsp = "[LSP]",
                  snippets = "[LuaSnip]",
                  buffer = "[Buffer]",
                  path = "[Path]",
                }
                return source_labels[ctx.source_name] or "[" .. ctx.source_name .. "]"
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      kind_icons = icon.kind or {},
    },
  })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", fg = "#C5CDD9" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#45475a", fg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = "#7E8294", strikethrough = true })
  vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#82AAFF", bold = true })
  vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = "#E06C75" })

end

return M
