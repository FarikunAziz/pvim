local M = {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 100
	end

	local mode = {
		"mode",
		fmt = function(str)
			return " " .. str
		end,
	}

	local space = {
		function()
			return "⌥ : " .. vim.opt.shiftwidth:get()
		end,
	}

	local filename = {
		"filename",
		file_status = true,
		path = 0,
		newfile_status = true,
		symbols = {
			modified = "󰚼 ",
			readonly = " ",
			unnamed = "󰺴 ",
			newfile = " ",
		},
	}

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
		diagnostics_color = {
			error = { fg = "#8C1007" },
			warn = { fg = "#FFC900" },
			info = { fg = "#568F87" },
			hint = { fg = "#8AA624" },
		},
		colored = true,
		update_in_insert = false,
		always_visible = false,
		cond = hide_in_width,
	}

	local diff = {
		"diff",
		colored = false,
		diff_color = {
			added = "LuaLineDiffAdd",
			modified = "LuaLineDiffChange",
			removed = "LuaLineDiffDelete",
		},
		symbols = { added = " ", modified = " ", removed = " " },
		cond = hide_in_width,
	}

	local time = {
		"os.date('%H:%M')",
		cond = hide_in_width,
	}

	local pomo = function()
		local status, tomat = pcall(require, "pomo")
		if not status then
			return ""
		end

		local timer = tomat.get_first_to_finish()
		if timer == nil then
			return ""
		end

		local timer_str = tostring(timer)

		local menit = timer_str:match("(%d+)m")
		if not menit then
			return ""
		end

		local icon = " "
		if timer.name:lower():match("break") then
			icon = "󰂠 "
		end

    local nama_timer = timer.name
		local nomor_sesi = timer.name:match("%d+")
    local status_manual = nama_timer:match("#")

    if nomor_sesi and not status_manual then
      return string.format("%s%sM %sX", icon, menit, nomor_sesi)
    else
      if nama_timer:match("^Timer #") then
				nama_timer = "Timer"
			end

			local max_len = 6
			if #nama_timer > max_len then
				nama_timer = string.sub(nama_timer, 1, max_len) .. ".."
			end

			return string.format("%s%sM %s", icon, menit, nama_timer)
    end
  end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			section_separators = "",
			component_separators = "",
			disabled_filetypes = { "alpha", "neo-tree", "Avante" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { "branch" },
			lualine_c = { filename },
			lualine_x = { diagnostics, diff, "location" },
			lualine_y = { "progress", time },
			lualine_z = { pomo },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { { "location", padding = 0 } },
			lualine_y = { time },
			lualine_z = {},
		},
		tabline = {},
		extensions = { "fugitive" },
	})
end

return M
