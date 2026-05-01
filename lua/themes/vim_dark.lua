local theme_plugin_name = "codedark"
local colorscheme_name = "codedark"

local ok, theme = pcall(require, theme_plugin_name)

if ok and type(theme) == "table" and theme.setup then
    theme.setup({
      vim.g.codedark_term256=1
      vim.g.codedark_conservative=1
      vim.g.codedark_modern=1
      vim.g.codedark_italics=1
      vim.g.codedark_transparent=0
    })
end

local success = pcall(vim.cmd, "colorscheme " .. colorscheme_name)

if not success then
    vim.cmd("colorscheme habamax")
end

