vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--formater | conform
local function au(group, event, pattern, callback)
	vim.api.nvim_create_autocmd(event, {
		group = vim.api.nvim_create_augroup(group, { clear = true }),
		pattern = pattern,
		callback = callback,
	})
end
au("GlobalIndent", "FileType", { "*" }, function()
	-- Cek jika bukan python, maka set ke 2 spasi
	if vim.bo.filetype ~= "python" then
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	else
		-- Khusus Python tetap 4 spasi (Standar PEP 8)
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
	end
end)

--formater | conform
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
