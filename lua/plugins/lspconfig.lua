return {
  vim.lsp.enable({
    "bashls",
    "clangd",
    "cssls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "ts_ls",
  }),


  vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {current_line = true},
    underline = true,
    update_in_insert = false,
    serverty_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
      source = true,
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        [vim.diagnostic.severity.WARN] = "WarningMsg",
      },
    },
  }),


  --what happen?
  vim.keymap.set("n","gd","<cmd>lua vim.lsp.buf.definition()<CR>")
}
