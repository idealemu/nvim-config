return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    local show_completions = true
    local timer = nil

    -- Throttled auto-completion (less frequent to reduce lag)
    vim.api.nvim_create_autocmd("TextChangedI", {
      callback = function()
        if not show_completions then return end
        if cmp.visible() then return end

        -- Cancel existing timer
        if timer then
          vim.fn.timer_stop(timer)
          timer = nil
        end

        -- Delay completion by 300ms (adjust as needed)
        timer = vim.fn.timer_start(300, function()
          vim.schedule(function()
            -- Only complete if still in insert mode and no interrupt
            if vim.fn.mode() == "i" then
              cmp.complete()
            end
          end)
        end)
      end,
    })

    -- Cancel timer when leaving insert mode
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        if timer then
          vim.fn.timer_stop(timer)
          timer = nil
        end
      end,
    })

    -- Toggle completions
    vim.keymap.set("n", "<leader>l", function()
      show_completions = not show_completions
      vim.notify(show_completions and "Auto-completion enabled" or "Auto-completion disabled")
    end, { desc = "Toggle auto-completion" })

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 }, -- Require 2 chars before triggering
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-c>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter accepts
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.abort(),
      }),
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      -- Performance: limit completion items
      performance = {
        max_view_entries = 10,
      },
    })

    -- Hover documentation (moved outside cmp.setup)
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
