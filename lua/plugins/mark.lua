return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  config = function()
    require('marks').setup()

    -- Show all marks in current buffer (location list)
    vim.keymap.set('n', 'gm', ':MarksListBuf<CR>', { noremap = true, silent = true })
    -- Show all marks across ALL buffers
    vim.keymap.set('n', 'gM', ':MarksListAll<CR>', { noremap = true, silent = true })

  end,
}
