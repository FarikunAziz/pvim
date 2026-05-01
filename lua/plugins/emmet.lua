local M = {
  'mattn/emmet-vim',
}

function M.config()
  vim.g.user_emmet_mode = 'n'
  vim.g.user_emmet_mode = 'inv'
  vim.g.user_emmet_mode = 'a'

  vim.g.user_emmet_install_global = 0
  vim.cmd([[
    autocmd FileType html,css EmmetInstall
  ]])

  vim.g.user_emmet_leader_key = '<C-Y>'
end

return M
