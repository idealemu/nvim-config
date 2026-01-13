-- ==================================================
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },

      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- ==================================================

return require("lazy").setup({

    { "nvim-treesitter/nvim-treesitter",
      lazy = false,                        
      branch = 'master',  -- Needed due to breaking changes
      build = ":TSUpdate",                
      config = function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = { "lua", "vim", "python", "c_sharp", "typescript", "markdown", "groovy" },
          highlight = { enable = true },
          indent  = { enable = true },
        }
      end,
    },

    -- shared library
    "nvim-lua/plenary.nvim",

    -- ==================================================
    -- lazy-load the rest
    { "mbbill/undotree",     
        cmd = "UndotreeToggle",
        config = function() require("plugins.undotree") end
    },
    { "itchyny/lightline.vim",
        event = "VimEnter" 
    },
    { "junegunn/goyo.vim",
        cmd = "Goyo",
        config = function() require("plugins.goyo") end 
    },
    { "tpope/vim-commentary",
        event = "BufRead" 
    },
    { "ThePrimeagen/refactoring.nvim",
        cmd = "Refactor",
        dependencies = { "nvim-treesitter/nvim-treesitter", "plenary.nvim" },
        config = function() require("plugins.refactoring") end,
    },
    { "ckipp01/nvim-jenkinsfile-linter",
        dependencies = { "plenary.nvim" },
    },

    -- optional
    { "HiPhish/rainbow-delimiters.nvim",
        ft = { "lua", "cs", "html", "json", "sql", "ts", "js", "groovy" }
    },
    { "dhruvasagar/vim-table-mode",      
        ft = { "markdown", "text", "org" } 
    },

    -- colours
    { "navarasu/onedark.nvim",
    config = function()
            require("onedark").setup({ style = "dark" })
            vim.cmd.colorscheme("onedark")
        end,
    },
})
