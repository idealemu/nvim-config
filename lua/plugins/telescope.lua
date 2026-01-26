return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },


  keys = {
    { '<C-f>', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<C-g>', function() require('telescope.builtin').live_grep()  end, desc = 'Telescope live grep' },
    { '<leader>fb', function() require('telescope.builtin').buffers()   end, desc = 'Telescope buffers' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
  },
    config = function()
        require('telescope').setup({
          defaults = {
            mappings = {
              n = { ["q"] = require('telescope.actions').close },
            },
              preview = {
                  hide_on_startup = false, 
                  treesitter = { enable = true }
                },
              pickers = {
                find_files  = { preview = true },
                grep_string = { preview = true },
                live_grep   = { preview = true }
              },
          },
        })
      end,

    
}
