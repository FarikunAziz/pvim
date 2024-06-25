local M = {
  "mg979/vim-visual-multi",
  branch = 'master',
  event = "VeryLazy"
}

vim.cmd[[
  " disable all keys, except <c-n>
  let g:VM_default_mappings = 0

  " for mouse selection
  let g:VM_mouse_mappings = 1
]]

return M
