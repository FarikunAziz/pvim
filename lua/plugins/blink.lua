local M = {
	"saghen/blink.cmp",
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
}

function M.config()
	local icon = require("user.icons")

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
					columns = function(ctx)
						if ctx.mode == "cmdline" then
							return {
								{ "label", "label_description", gap = 1 },
								{ "source_name" },
							}
						else
							return {
								{ "kind_icon", "kind", gap = 1 },
								{ "label", "label_description", gap = 1 },
								{ "source_name" },
							}
						end
					end,

					components = {
						source_name = {
							text = function(ctx)
								local source_labels = {
									lsp = "󱁇 LSP",
									custom   = " Custom",
									snippets = " Friendly",
									buffer = " Buffer",
									path = " Path",
									cmdline = " Cmdline",
								}

                local name = string.lower(ctx.source_name)
                return source_labels[name] or ctx.source_name
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

		cmdline = {
			sources = { "cmdline" },
		},

		sources = {
			default = { "lsp", "path", "custom", "snippets", "buffer" },
      providers = {
        snippets = {
					name = "snippets",
					module = "blink.cmp.sources.snippets",
					score_offset = 10,
					opts = {
						friendly_snippets = true,
						search_paths = {},
					},
				},
				custom = {
					name = "custom",
					module = "blink.cmp.sources.snippets",
					score_offset = 100,
					opts = {
						friendly_snippets = false,
						search_paths = { vim.fn.stdpath("config") .. "/lua/user/my_snip" },
					},
				}
			}
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			kind_icons = icon.kind or {},
		},
	})

  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Pmenu" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })

  local kinds = {
    "Function", "Method", "Variable", "Constant", "Class", "Interface",
    "Struct", "Property", "Field", "Constructor", "Enum", "EnumMember",
    "Event", "Operator", "TypeParameter", "Module", "File", "Folder",
    "Keyword", "Snippet", "Color", "Reference", "Text", "Unit", "Value"
  }

  for _, kind in ipairs(kinds) do
    vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { link = "CmpItemKind" .. kind, default = true })
  end

  vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { link = "CmpItemAbbrMatch" })
  vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = "#7E8294", strikethrough = true })

  -- hapus sorotan snippet
  vim.api.nvim_set_hl(0, "SnippetTabstop", { bg = "NONE", underline = false })

end

return M
