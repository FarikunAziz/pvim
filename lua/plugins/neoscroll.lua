local M = {
  "nvim-neorocks/neoscroll.nvim", 
  event = {"BufReadPre","BufNewFile"},
}

-- default : <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb

function M.config()
  local neoscroll = require('neoscroll')
  neoscroll.setup({
       hide_cursor = true,
       stop_eof = true,
       respect_scrolloff = false,
       cursor_scrolls_alone = true,
       easing_function = "quadratic",

       pre_hook = function ()
         local buf = vim.api.nvim_get_current_buf()
         pcall(vim.treesitter.stop,buf);
         vim.cmd("syntax off")
       end,
       post_hook = function ()
         local buf = vim.api.nvim_get_current_buf()
         vim.cmd("syntax on")
         pcall(vim.treesitter.start,buf)
       end,

       performance_mode = false, 
  })

  local keymap = {
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250; easing = 'sine' }) end,
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250; easing = 'sine' }) end,

    ["<S-k>"] = function() neoscroll.ctrl_b({ duration = 450; easing = 'circular'}) end,
    ["<S-j>"] = function() neoscroll.ctrl_f({ duration = 450; easing = 'cubic' }) end,

    ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end,
    ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end,
    ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
    ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
    ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
  }

  local modes = { 'n', 'v', 'x' }
  for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
  end
end

return M
