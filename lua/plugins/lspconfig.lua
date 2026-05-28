local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
	},
}

function M.config()
	local lspconfig = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local icons = require("user.icons")

	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"ts_ls",
		"pyright",
		"bashls",
		"jsonls",
	}

  local capabilities = require("blink.cmp").get_lsp_capabilities()
  local lsp_defaults = lspconfig.util.default_config
	lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, capabilities)

  local function check_clangd_installation()
    local status_mason, mason_registry = pcall(require, "mason-registry")
    if not status_mason then return end

    if mason_registry.is_installed("clangd") then
      table.insert(servers, "clangd")
      return
    end

    local flag_path = vim.fn.stdpath("data") .. "/clangd_prompt_done"
    if vim.fn.filereadable(flag_path) == 1 then
      return
    end

    vim.schedule(function()
      vim.ui.select({ "1. Yes (Install Sekarang)", "2. No (Install Nanti Manual)" }, {
        prompt = "nvim mendeteksi clangd (C/C++) belum terpasang. Mau menginstalnya sekarang? [Ukuran file BESAR]:",
      }, function(choice)
          local file = io.open(flag_path, "w")
          if file then file:close() end

          if choice and choice:match("Yes") then
            vim.notify("Mengunduh clangd via Mason... Mohon tunggu sebentar.", vim.log.levels.INFO)
            vim.cmd("MasonInstall clangd")

            table.insert(servers,"clangd")
            vim.lsp.enable({"clangd"})

            local status_lsp, lspconfig = pcall(require, "lspconfig")
            if status_lsp and lspconfig.clangd then
              lspconfig.clangd.setup({})
            end

          else
            vim.notify("Instalasi clangd dilewati, ketik :Mason untuk install manual", vim.log.levels.WARN)
          end
        end)
    end)
  end

  check_clangd_installation()

	mason.setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
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
				[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning or " ",
				[vim.diagnostic.severity.INFO] = icons.diagnostics.Info or " ",
				[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint or " ",
			},
		},
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
			vim.keymap.set(
				"n",
				"gl",
				vim.diagnostic.open_float,
				{ buffer = ev.buf, desc = "Show diagnostic error in float" }
			)
		end,
	})
end

return M
