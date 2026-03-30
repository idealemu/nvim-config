local mason_lspconfig = require('mason-lspconfig')

local custom_servers = { "pylsp", "ruff" }
mason_lspconfig.setup({
  ensure_installed = {"pylsp", "ruff"},
  handlers = {
    -- Default handler for all servers except those in custom_servers
    function(server_name)
      if not vim.tbl_contains(custom_servers, server_name) then
        vim.lsp.config(server_name, {})
      end
    end,
  },
})

-- PYLSP custom config
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false }, -- Ruff conflicting
        pycodestyle = {
            ignore = {"E501"},
            -- maxLineLength = 100, -- E501 override
        },
      },
    },
  },
})


-- Ruff custom config
vim.lsp.config('ruff', {
  settings = {
    args = {
      "--enable=ARG001",  -- Unused function argument
      "--enable=F841",    -- Unused variable
    },
  },
})
