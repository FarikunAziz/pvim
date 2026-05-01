vim.opt.backup = false
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect","noinsert"}
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10

vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true

vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 4
vim.opt.tabstop = 2

--its slowdown my terminator
vim.opt.cursorline = false

vim.opt.number = true
vim.opt.laststatus = 4
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 3

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.wrap = true
vim.opt.scrolloff = 8

vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.winborder = "solid"

vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.synmaxcol = 128
vim.cmd([[
  syntax sync minlines=256
]])

--coloring cmp
-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })

vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

vim.filetype.add { extension = { tf = 'terraform' } }
vim.filetype.add { extension = { tfvars = 'terraform' } }
vim.filetype.add { extension = { pipeline = 'groovy' } }
vim.filetype.add { extension = { multibranch = 'groovy' } }
