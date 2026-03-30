-- ==================================================
vim.g.mapleader = " "                -- Set leader before lazy requires it


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
-- ==================================================
require("config.lazy")              
require("config.set")                
require("config.lsp")
require("config.clipboard")
require("config.colorscheme") 
-- ==================================================
