local M = {
  'mattn/emmet-vim',
  lazy = true,
  ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "xml" },
}

function M.init()
  vim.g.user_emmet_leader_key = '<C-Y>'

  vim.g.user_emmet_mode = 'a'

  vim.g.user_emmet_install_global = 0
end

function M.config()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "javascriptreact", "typescriptreact", "vue", "xml" },
    command = "EmmetInstall",
  })
end

return M
