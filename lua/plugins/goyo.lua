return {
     'junegunn/goyo.vim',


    keys = { { '<leader>gf', '<Cmd>Goyo<CR>', desc = 'Toggle Goyo', silent = true } },

    config = function()


        vim.g.goyo_height = "60%"
        vim.g.goyo_width = 100 

        vim.api.nvim_create_autocmd('User', {
          pattern = 'GoyoEnter',
          command = 'set bg=dark linebreak',
        })

    end
}


