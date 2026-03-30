local mason_lspconfig = require('mason-lspconfig')

-- 1. Configure LSP servers directly with vim.lsp.config()
-- These configs are registered but NOT yet enabled
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        -- Disable all linters
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        ruff = { enabled = false },  

        -- Keep useful features
        jedi_completion = { enabled = true },
        jedi_hover = { enabled = true },
        jedi_signature_help = { enabled = true },
      },
    },
  },
})

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      lint = {
        select = { "ARG001", "F841" },
      },
    },
  },
})

-- 2. Setup mason-lspconfig 
mason_lspconfig.setup({
  ensure_installed = { "pylsp", "ruff" },
})
