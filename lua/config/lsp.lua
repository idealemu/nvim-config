local mason_lspconfig = require('mason-lspconfig')

-- 1. Configure LSP servers directly with vim.lsp.config()
-- These configs are registered but NOT yet enabled
-- TODO: use jedi instead of pylsp
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
        select = {  "ALL" },
        ignore = {  "D103", 
                    "D205",
                    "D212",
                    "E501",
                    "PLR2004",
                    "FBT003",
                    "FBT002",
                    "ERA001",
                    "T201",
                },
      },
    },
  },
})

-- 2. Setup mason-lspconfig 
mason_lspconfig.setup({
  ensure_installed = { "pylsp", "ruff" },
})
