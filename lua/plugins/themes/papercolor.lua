local shinobi = {
  "NLKNguyen/papercolor-theme",
  event = "InsertEnter"
}

shinobi.name = "PaperColor"

vim.opt.background = "dark" -- dark / light
vim.cmd[[
  let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 0,
  \       'allow_italic':1,
  \       'allow_bold':1,
  \     },
  \     'default.light':{
  \       'transparent_background':0,
  \       'allow_italic':1,
  \       'allow_bold':1,
  \     }
  \   },
  \
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
]]

return shinobi
