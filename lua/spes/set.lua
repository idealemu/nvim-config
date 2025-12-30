-- ==================================================
-- Settings
-- ==================================================
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = true
vim.wo.wrap = true

-- Lines
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.expandtab = true
vim.smartindent = false

-- Backups and undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Spell
vim.opt.spelllang={"en_us", "fr"}
vim.cmd([[autocmd FileType markdown,tex,txt setlocal spell]])

-- Disables automatic commenting on newline:
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Misc
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
-- vim.opt.showmatch = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse='a'
vim.opt.ruler = false
vim.opt.scrolloff = 0
vim.g.loaded_matchparen = 1

-- ==================================================
-- Remaps
-- ==================================================
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open netrw file explorer
vim.keymap.set("n", "Q", "<nop>") -- Disable ex mode (mode is useful for scripting only)

vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move selected lines up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down

vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Page up and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Page down and center cursor

vim.keymap.set("n", "n", "nzzzv") -- Next search match, center and restore fold
vim.keymap.set("n", "N", "Nzzzv") -- Previous search match, center and restore fold

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", "\"_dP") 

-- Paste in visual mode, keep register
vim.keymap.set('v', 'p', [["_dP]], { noremap = true, silent = true })

-- Replace word under cusor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) 

-- Make file executable (chmod +x) on local file
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Fix spelling in insert mode
vim.keymap.set("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u") 

-- Toggle spell check (en_us)
vim.keymap.set("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>") 

-- Toggle Table Mode
vim.keymap.set("n", "<leader>tm", ":TableModeToggle<CR>", { desc = "Toggle Table Mode" })

-- NOTE: currently using sudoedit instead
-- vim.keymap.set("c", "w!!", "w !sudo tee > /dev/null %") -- Save file with sudo (alternative)
-- https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work/7078429#7078429
