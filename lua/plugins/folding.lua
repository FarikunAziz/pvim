local M = {
  'bbjornstad/pretty-fold.nvim',
   event = "VeryLazy",
}

function M.config()
   require('pretty-fold').setup{
      keep_indentation = false,
      fill_char = '━',
      sections = {
         left = {
            '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
         },
         right = {
            '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
         }
      },

      process_comment_signs = 'spaces',
   }
end

return M
