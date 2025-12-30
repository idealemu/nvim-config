-- ==================================================
-- Packer define plugins
-- ==================================================
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer itself

  -- Treesitter for syntax parsing
  -- after/plugin/treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- General utilities
  use 'nvim-lua/plenary.nvim'

  -- Undo history visualization
  -- after/plugin/undotree
  use 'mbbill/undotree'

  -- Lightweight status line
  use 'itchyny/lightline.vim'

  -- Distraction-free writing mode
  -- after/plugin/goyo
  use 'junegunn/goyo.vim'

  -- Comment lines easily
  use 'tpope/vim-commentary'

  -- Refactoring tools
  -- after/plugin/refactoring
  use({
    'ThePrimeagen/refactoring.nvim',
    requires = {
      'nvim-lua/plenary.nvim',  
      'nvim-treesitter/nvim-treesitter',
    },
  })

  -- Color scheme: One Dark
  use 'navarasu/onedark.nvim'

  -- Table editor for markup
  use {
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'text', 'org' },
  }

end)
