local M = {
  "karb94/neoscroll.nvim",
   event = "VeryLazy",
}

-- default is : <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb

function M.config()
   require('neoscroll').setup({
       hide_cursor = true,          -- Hide cursor while scrolling
       stop_eof = true,             -- Stop at <EOF> when scrolling downwards
       respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
       easing_function = "quadratic",       -- Default easing function
       -- pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
       -- post_hook = function(info) if info == "cursorline" then vim.wo.cursorline = true end end,
       pre_hook = nil,
       post_hook = nil,
       performance_mode = true,    -- Disable "Performance Mode" on all buffers.
   })

   local t = {}

   -- Syntax: t[keys] = {function, {function arguments}}
   --quadratic, cubic, quartic, quintic, circular, sine
   t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
   t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}

   t['<S-k>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}
   t['<S-j>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']]}}

   t['<C-y>'] = {'scroll', {'-0.10', 'false', '200', 'cubic'}}
   t['<C-e>'] = {'scroll', { '0.10', 'false', '200', 'cubic'}}

   t['zt']    = {'zt', {'300'}}
   t['zz']    = {'zz', {'300'}}
   t['zb']    = {'zb', {'300'}}

   require('neoscroll.config').set_mappings(t)
end

return M
