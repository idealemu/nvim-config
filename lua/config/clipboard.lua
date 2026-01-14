-- ==================================================
-- Clipboard settings 
-- ==================================================
if vim.fn.has('win32') == 1 then
  -- Windows (native PowerShell/cmd.exe)
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
else
  -- generic Unix 
  vim.g.clipboard = {
    name = 'xclip-strip-cr',
    copy = {
      ['+'] = { 'xclip', '-selection', 'clipboard', '-i' },
      ['*'] = { 'xclip', '-selection', 'primary', '-i' },
    },
    paste = {
      ['+'] = { 'sh', '-c', 'xclip -selection clipboard -o | tr -d "\r"' },
      ['*'] = { 'sh', '-c', 'xclip -selection primary -o | tr -d "\r"' },
    },
    cache_enabled = 0,
  }
end
vim.opt.clipboard = 'unnamedplus'
