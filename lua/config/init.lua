-- ==================================================
vim.g.mapleader = " "                -- Set leader before lazy requires it


-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
-- ==================================================
require("config.lazy")               -- Plugins
require("config.set")                -- Remaps and settings
require("config.clipboard")
require("config.colorscheme") -- Colorscheme
-- ==================================================
