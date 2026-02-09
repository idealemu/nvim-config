return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- file icons

  --  Global key-maps (work from any buffer)
  keys = {
    { '<C-n>',      ':NvimTreeToggle<CR>',  desc = 'Toggle tree' },
    { '<leader>pv', ':NvimTreeToggle<CR>',  desc = 'Toggle tree' },
  },

  config = function()   -- callback to set keymaps in local buffer
        local function build_keymaps_for_local_nvimtree_buffer(bufnr)
            local api = require('nvim-tree.api')

            -- Wrapper so we can pass the same options to every map set
            local function opts(desc)
                return {
                   desc = 'nvim-tree: ' .. desc,
                   buffer = bufnr,   -- only active inside the tree buffer
                   noremap = true,
                   silent = true,
                   nowait = true,
                 }
            end

        api.config.mappings.default_on_attach(bufnr) -- Keep default mappings
        vim.keymap.set('n', 's', api.node.open.horizontal, opts('Split: horizontal'))
        vim.keymap.set('n', 'v', api.node.open.vertical,   opts('Split: vertical'))
    end

    -- Final setup call
    require('nvim-tree').setup({
        on_attach = build_keymaps_for_local_nvimtree_buffer,
        sort    = { sorter = 'case_sensitive' }, -- Options from nvim-tree/explorer/sorter.lua
        view    = { width = 30 },
        renderer = { group_empty = true },	 -- Collapses chains of single-child folders into one line
        filters  = { dotfiles = true },		 -- Hides files whose name starts with a dot 

        update_focused_file = { -- Focus current file in buffer
            enable = true,
            update_root = true,
          },
    })
  end,
}
