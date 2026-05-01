local theme_plugin_name = "onedark"
local colorscheme_name = "onedark"

local ok, theme = pcall(require, theme_plugin_name)

if ok and type(theme) == "table" and theme.setup then
    theme.setup({})
end

local success = pcall(vim.cmd, "colorscheme " .. colorscheme_name)

if not success then
    vim.cmd("colorscheme habamax")
end

