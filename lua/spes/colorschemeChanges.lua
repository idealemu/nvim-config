-- ==================================================
-- Color schemes default and cycling
-- ==================================================
local colorschemes = {
  'desert',
  'darkblue',
  'ron',
  'onedark',
}

local current_index = 0

local function cycle_colorscheme()
  current_index = (current_index % #colorschemes) + 1
  local scheme = colorschemes[current_index]
  vim.cmd("colorscheme " .. scheme)
  print("Colorscheme: " .. scheme) -- Optional feedback
end

vim.keymap.set('n', '<leader>c', cycle_colorscheme, { silent = true })
vim.cmd("colorscheme onedark") -- set default 

-- ==================================================
