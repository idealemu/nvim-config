return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",       
    "sindrets/diffview.nvim",       
    "nvim-telescope/telescope.nvim", 
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    {
        "<leader>gl", -- V mode
        function()
          local file = vim.fn.expand("%:p")
          vim.cmd([[execute "normal! \<ESC>"]])
          local line_start = vim.fn.getpos("'<")[2]
          local line_end = vim.fn.getpos("'>")[2]
          require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
        end,
        desc = "Neogit Log for this range",
        mode = "v",
      },
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%:p")
          require("neogit").action("log", "log_current", { "--", file })()
        end,
        desc = "Neogit Log for this file",
      },
    },

    config = {
        graph_style = "unicode",
    },   
}
