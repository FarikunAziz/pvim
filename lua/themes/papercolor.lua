local theme_plugin_name = "PaperColor"
local colorscheme_name = "PaperColor"

local ok, theme = pcall(require, theme_plugin_name)

if ok and type(theme) == "table" and theme.setup then
    theme.setup({
      vim.opt.background = "dark" -- dark / light,
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
  })
end

local success = pcall(vim.cmd, "colorscheme " .. colorscheme_name)

if not success then
    vim.cmd("colorscheme habamax")
end

