return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    local show_completions = true

    -- Toggle completions
    vim.keymap.set("n", "<leader>l", function()
      show_completions = not show_completions
      if show_completions then
        cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
        vim.notify("Auto-completion enabled")
      else
        cmp.setup({ completion = { autocomplete = false } })
        vim.notify("Auto-completion disabled")
      end
    end, { desc = "Toggle auto-completion" })

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-c>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.abort(),
      }),
      completion = {
        autocomplete = show_completions and { cmp.TriggerEvent.TextChanged } or false,
        completeopt = "menu,menuone,noinsert",
        keyword_length = 2,  -- Now properly respected
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      performance = {
        max_view_entries = 10,
      },
    })

    vim.keymap.set('n', 'H', vim.lsp.buf.hover, { desc = 'Show hover documentation' })

    vim.o.updatetime = 500
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        local ok, win = pcall(vim.api.nvim_get_option, "winid")
        if ok and vim.api.nvim_win_get_config(win).zindex then return end

        vim.diagnostic.open_float(nil, {
          focus = false,
          source = "always"
        })
      end,
    })
  end,
}
