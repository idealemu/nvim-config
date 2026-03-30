local mason_lspconfig = require('mason-lspconfig')



mason_lspconfig.setup({
  ensure_installed = {"pylsp"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = {"pylsp"},
  handlers = {
    function(server_name)
      -- Default handler for all servers except custom configs
      if server_name ~= "pylsp" then
        require('lspconfig')[server_name].setup({})
      end
    end,
  },
})

-- PYLSP custom config
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {"E501"},
          -- maxLineLength = 100, -- E501 override
        },
      },
    },
  },
})
