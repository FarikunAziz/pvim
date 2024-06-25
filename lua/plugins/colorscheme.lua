local sempak = require "plugins.themes.ayu"

sempak.lazy =  false
sempak.priority = 1000

--dui built-in themes
sempak.name = "lunaperche"

function sempak.config()
  local ok, _ = pcall(vim.cmd.colorscheme,sempak.name)
  if not ok then
    return
  end
end

return sempak
