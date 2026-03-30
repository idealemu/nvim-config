return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    local show_completions = true

    -- Toggle auto-completion
    vim.api.nvim_create_autocmd("TextChangedI", {
      callback = function()
        if not show_completions then return end
        if cmp.visible() then return end
        cmp.complete()
      end
    })

    -- Map <leader>c to toggle completions in normal mode
    vim.keymap.set("n", "<leader>l", function()
      show_completions = not show_completions
      if show_completions then
        vim.notify("Auto-completion enabled")
      else
        vim.notify("Auto-completion disabled")
      end
    end, { desc = "Toggle auto-completion" })

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-c>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.abort(),
        ['<C-e>'] = cmp.mapping.abort(), -- Exit completion
      }),
      -- Show completions as you type
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      -- Enable hover documentation
      window = {
        documentation = cmp.config.window.bordered(),
      },
      vim.keymap.set('n', 'H', vim.lsp.buf.hover, { desc = 'Show hover documentation' })
    })


    vim.o.updatetime = 500
    -- Automatically show diagnostics on cursor hold, if no other floating window is active
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        local ok, win = pcall(vim.api.nvim_get_option, "winid")
        if ok and vim.api.nvim_win_get_config(win).zindex then return end

        vim.diagnostic.open_float(nil, { 
          focus = false, 
          source = "always" 
        })
      end
    })
  end
}
