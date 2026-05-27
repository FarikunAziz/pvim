local M = {
	"ibhagwan/fzf-lua",
	keys = {
		{ "<leader>fb", function() require("fzf-lua").buffers({ winopts = { preview = { hidden = "hidden" } } }) end, desc = "Find Buffer" },
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Find Files" },
		{ "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent File" },
		{ "<leader>ft", function() require("fzf-lua").live_grep() end, desc = "Find Text" },

		{ "<leader>fp", function() require("fzf-lua").profiles() end, desc = "Projects" },

		{ "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help" },
		{ "<leader>fl", function() require("fzf-lua").resume() end, desc = "Last Search" },
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
	local actions = fzf.actions

	fzf.setup({
    multiprocess = true,

    --[caps off] -> matikan jika ingin fungsi capslock kembali menjadi seleksi
    keymap = {
      fzf = {
        ["tab"] = "down",
        ["shift-tab"] = "up",
      },
    },

    defaults = {
			formatter = "path.filename_first",
      file_icons = false,
			git_icons = false,
		},

		fzf_opts = {
			["--layout"] = "reverse",
			["--info"] = "inline-right",
      ["--pointer"] = "󱋴",
		},

		winopts = {
			height = 0.85,
			width = 0.90,
			border = "single",

      --[caps off]
      fzf_cli_args = "--bind=tab:down,shift-tab:up",

			preview = {
				layout = "horizontal",
				vertical = "right:55%",
				border = "noborder",
        winopts = {
					number = false,
					relativenumber = false,
          signcolumn = "yes",
				},
			},

			on_close = function()
				vim.cmd("redraw!")
			end,
		},

    actions = {
      files = {
        ["default"] = actions.file_edit,
      }
    },

    files = {
      cwd_prompt = false,
      prompt = 'Files>',
    }
	})
end

return M
