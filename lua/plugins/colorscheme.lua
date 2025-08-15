local sempak = require "plugins.themes.ayu"

sempak.lazy =  false
sempak.priority = 1000

--timpa colorscheme, matikan jika perlu
sempak.name = "industry"

function sempak.config()
  local ok, _ = pcall(vim.cmd.colorscheme,sempak.name)
  if not ok then
    return
  end
end

return sempak
