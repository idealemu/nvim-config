local mason_lspconfig = require('mason-lspconfig')



mason_lspconfig.setup({
  ensure_installed = {"pylsp"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
