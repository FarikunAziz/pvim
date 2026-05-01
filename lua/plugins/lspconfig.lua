local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}


function M.config()
  local lspconfig = require('lspconfig')
  local mason = require('mason')
  local mason_lspconfig = require('mason-lspconfig')
  local icons = require('user.icons')

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "ts_ls",
    "pyright",
    "bashls",
    "jsonls",
  }

  mason.setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
  })

  vim.lsp.enable(servers)

  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",

    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error or " ",
        [vim.diagnostic.severity.WARN]  = icons.diagnostics.Warning or " ",
        [vim.diagnostic.severity.INFO]  = icons.diagnostics.Info or " ",
        [vim.diagnostic.severity.HINT]  = icons.diagnostics.Hint or " ",
      },
    },
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {buffer = ev.buf, desc = "Show diagnostic error in float" })
    end,
  })
end

return M
