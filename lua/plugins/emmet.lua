local M = {
  'mattn/emmet-vim',
   ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "xml" },
}

function M.init()
  vim.g.user_emmet_leader_key = '<C-Y>'
  
  vim.g.user_emmet_mode = 'a'
  
  vim.g.user_emmet_install_global = 0
end

function M.config()
end

return M
