vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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
