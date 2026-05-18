return {
  {
    "Shatur/neovim-ayu",
    lazy = true,
    event = "VeryLazy",
  },

  {
    'zSnails/cityscape.nvim',
    lazy = true,
    event = "VeryLazy",
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    event = 'VeryLazy',
  },

  {
    'savq/melange-nvim',
    lazy = true,
    event = 'VeryLazy',
  },

  {
    'bluz71/vim-moonfly-colors',
    lazy = false,
    priority = 1000,
    config = function()
      require('themes.moonfly')
    end,
  },

  {
    'NLKNguyen/papercolor-theme',
    lazy = true,
    event = 'VeryLazy',
  },

  {
    'pineapplegiant/spaceduck',
    lazy = true,
    event = 'VeryLazy',
  },

  {
    'folke/tokyonight.nvim',
    lazy = true,
    event = 'VeryLazy',
  },

  {
    'tomasiser/vim-code-dark',
    lazy = true,
    event = 'VeryLazy',
  }
}
