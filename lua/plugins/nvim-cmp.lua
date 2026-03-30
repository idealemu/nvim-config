return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-c>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      -- Show completions as you type
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
    })

    vim.api.nvim_create_autocmd("TextChangedI", {
      callback = function()
        if cmp.visible() then return end
        cmp.complete()
      end
    })
  end
}
