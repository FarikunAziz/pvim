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
vim.opt.foldmethod = "indent"
vim.opt.signcolumn = "yes"
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
