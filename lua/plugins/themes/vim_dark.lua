local shinobi = {
  'tomasiser/vim-code-dark',
  event ="InsertEnter"
}

function ramen()
  --" If you don't like many colors and prefer the conservative style of the standard Visual Studio
  vim.g.codedark_conservative=1
  --" If you like the new dark modern colors (Needs feedback!)
  vim.g.codedark_modern=1
  --" Activates italicized comments (make sure your terminal supports italics)
  vim.g.codedark_italics=1
  --" Make the background transparent
  vim.g.codedark_transparent=0
end

ramen()
vim.g.codedark_term256=1
shinobi.name = 'codedark'

return shinobi
