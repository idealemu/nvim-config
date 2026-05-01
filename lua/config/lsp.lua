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
                    -- "D400",
                    -- "D415",
                    "E501",
                    "PLR2004",
                    "FBT003",
                    "FBT002",
                    "ERA001",
                    "T201",
                    "TD",
                },
      },
    },
  },
})

-- PowerShell LSP configuration
vim.lsp.config('powershell_es', {
  bundle_path = vim.fn.stdpath('data') .. '/mason/packages/powershell-editor-services',
  shell = 'pwsh',
  settings = {
    powershell = {
      codeFormatting = {
        Preset = 'OTBS',
      },
    },
  },
})

vim.lsp.config('lemminx', {
  cmd = {"lemminx"},
  filetypes = {'xml', 'xsd', 'xsl', 'svg'},
  single_file_support = true,
  settings = {
    xml = {
      validation = {
        enabled = true
      },
      formatting = {
        enabled = true
      }
    }
  },
})

-- 2. Setup mason-lspconfig
mason_lspconfig.setup({
  ensure_installed = { "pylsp", "ruff", "powershell_es", "lemminx" },
})


-- DEFAULT LSP keybinds https://neovim.io/doc/user/lsp/
-- "gra" (Normal and Visual mode) is mapped to vim.lsp.buf.code_action()
-- "gri" is mapped to vim.lsp.buf.implementation()
-- "grn" is mapped to vim.lsp.buf.rename()
-- "grr" is mapped to vim.lsp.buf.references()
-- "grt" is mapped to vim.lsp.buf.type_definition()
-- "grx" is mapped to vim.lsp.codelens.run()
-- "gO" is mapped to vim.lsp.buf.document_symbol()
-- CTRL-S (Insert mode) is mapped to vim.lsp.buf.signature_help()
-- v_an and v_in fall back to LSP vim.lsp.buf.selection_range() if treesitter is not active.
-- gx handles textDocument/documentLink. Example: with gopls, invoking gx on "os" in this Go code will open documentation externally:
