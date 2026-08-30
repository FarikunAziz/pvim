return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Tetap di main untuk Neovim v0.12+
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "bash", "cpp", "css", "html", "json", "python", "typescript", "javascript", "markdown", "markdown_inline"
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- Menggunakan modul .config bawaan branch main
      require("nvim-treesitter.config").setup(opts)
    end,
  },

  -- Konfigurasi textobjects yang sudah disesuaikan untuk branch main
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main", -- <--- Pastikan textobjects juga ikut menggunakan branch main
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- Perbaikan: Panggil langsung .setup tanpa sub-modul .configure
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      })
    end
  }
}
