-- Make sure packer is installed
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Required dependency for diffview
  use 'nvim-lua/plenary.nvim'

  -- Diffview plugin
  use 'sindrets/diffview.nvim'
end)
