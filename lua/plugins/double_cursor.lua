local M = {
	"mg979/vim-visual-multi",
	branch = "master",
	event = "VeryLazy",
}

function M.init()

	vim.g.VM_default_mappings = 0

	vim.g.VM_single_mode_maps = 0

	vim.g.VM_mouse_mappings = 1

	vim.g.VM_maps = {
		['Find Under'] = '<C-n>',
		['Find Subword Under'] = '<C-n>',
    ['Skip Region'] = '<table_unmapped>',
	}
end

return M

