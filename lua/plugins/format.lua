local M = {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
}

function M.config()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			lua = { "stylua" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "--style={IndentWidth: 2}" },
			},
		},
	})
end

return M
