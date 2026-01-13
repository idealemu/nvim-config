vim.keymap.set('n', '<leader>f', ':Goyo<CR>', { noremap = true, silent = true })
vim.cmd('autocmd! User GoyoEnter :set bg=dark | set linebreak')
