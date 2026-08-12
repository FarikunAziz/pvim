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

--markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "id"

    vim.api.nvim_set_hl(0, "SpellBad", { fg = "#E63946", undercurl = true, sp = "#E63946" })
		vim.api.nvim_set_hl(0, "SpellCap", { fg = "#8B1E2D", undercurl = true, sp = "#8B1E2D" })

    -- warna untuk tipe2 teks
    -- 1. WARNA UNTUK TEKS BOLD (Tebal)
    vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#FF9A00", bold = true })

    -- 2. WARNA UNTUK TEKS ITALIC (Miring)
    vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#44A1A4", italic = true })

    -- 3. WARNA UNTUK TEKS STRIKEOUT / STRIKETHROUGH (Coret)
    vim.api.nvim_set_hl(0, "@markup.strikethrough.markdown_inline", { fg = "#325E6A", strikethrough = true })

    -- 4. superscript
    vim.api.nvim_set_hl(0, "@markup.superscript.markdown_inline", { fg = "#73daca" })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- 1. Tombol Enter Otomatis Meneruskan Checkbox (Insert Mode)
		vim.keymap.set("i", "<CR>", function()
			local line = vim.api.nvim_get_current_line()
			local indent, has_box = line:match("^(%s*)%-%s*(%[%s*[x%s]*%])")

			if indent and has_box then
				if line:match("^%s*%-%s*%[%s*%]%s*$") or line:match("^%s*%-%s*%[%s*x%s*%]%s*$") then
					vim.api.nvim_set_current_line(indent)
					return "<CR>"
				end
				return "<CR>" .. indent .. "- [ ] "
			end

			return "<CR>"
		end, { buffer = true, expr = true, desc = "Auto-continue Markdown Checkbox" })

		-- 2. Tombol Toggle Checkbox + Efek Coret Tulisan (Mendukung Indentasi)
		vim.keymap.set("n", "<leader>x", function()
			local line = vim.api.nvim_get_current_line()

			if line:match("%-%s*%[%s*%]") then
				local new_line = line:gsub("(%-%s*%[)%s*(%])", "%1x%2")
				if not new_line:match("~~.*~~") then
					new_line = new_line:gsub("(%-%s*%[%s*x%s*%]%s*)(.*)", "%1~~%2~~")
				end
				vim.api.nvim_set_current_line(new_line)
			elseif line:match("%-%s*%[%s*x%s*%]") then
				local new_line = line:gsub("(%-%s*%[)%s*x%s*(%])", "%1 %2")
				if new_line:match("~~.*~~") then
					new_line = new_line:gsub("(%-%s*%[%s*%]%s*)~~(.*)~~", "%1%2")
				end
				vim.api.nvim_set_current_line(new_line)
			end
		end, { buffer = true, desc = "Toggle Checkbox and Strikethrough" })

		-- 3. FITUR ANGKA 2 SUPERSCRIPT (CONTOH: nama-nama -> nama²)
		vim.cmd([[iabbrev <buffer> 2² ²]])

		-- 4 otomatis huruf pertama menjadi kapital setelah . atau ada baris baru
		vim.keymap.set("i", "2", function()
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]
			local before_cursor = line:sub(1, col)

			if before_cursor:match("%a+$") then
				return "²"
			else
				return "2"
			end
		end, { buffer = true, expr = true, desc = "Auto superscript 2 for word repetition" })

		local bufnr = vim.api.nvim_get_current_buf()
		vim.api.nvim_create_autocmd("TextChangedI", {
			buffer = bufnr,
			callback = function()
				local line = vim.api.nvim_get_current_line()
				local cursor = vim.api.nvim_win_get_cursor(0)
				local row = cursor[1]
				local col = cursor[2]

				local before = line:sub(1, col)
				local after = line:sub(col + 1)

				-- kasus A: Setelah tanda titik (contoh: "ini. baru" -> "ini. Baru")
				local char_after_dot = before:match("%.%s+([a-z])$")

				-- kasus B: Huruf pertama di baris baru / setelah enter (contoh: "  baru" -> "  Baru")
				local indent, char_after_enter = before:match("^(%s*)([a-z])$")

				if char_after_dot then
					local upper_char = char_after_dot:upper()
					local new_before = before:sub(1, #before - 1) .. upper_char
					vim.api.nvim_set_current_line(new_before .. after)
					vim.api.nvim_win_set_cursor(0, { row, col })
				elseif char_after_enter then
					-- Pastikan bukan bagian dari tanda checkbox list seperti "- [ ] "
					if not line:match("^%s*%-%s*%[%s*[x%s]*%]%s*[a-zA-Z]$") then
						local upper_char = char_after_enter:upper()
						local new_before = indent .. upper_char
						vim.api.nvim_set_current_line(new_before .. after)
						vim.api.nvim_win_set_cursor(0, { row, col })
					end
				end
			end,
		})

    -- vim.opt_local.breakindent = true
    -- vim.opt_local.breakindentopt = "min:20,shift:3"
    -- vim.opt_local.wrap = true
	end,
})
