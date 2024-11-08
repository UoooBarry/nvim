-- github desktop
local function get_git_root()
  local dot_git_path = vim.fn.finddir(".git", ".;")
  return vim.fn.fnamemodify(dot_git_path, ":h")
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>gd', function ()
  vim.cmd('silent! !github ' .. get_git_root())
end, { desc = '[G]ithub [D]esktop', silent = true })

vim.keymap.set('n', '<leader>trl', function ()
  require('nvim-numbertoggle').toggle()
end)
-- barbar keysetting
vim.keymap.set('n', '<C-1>', function()
  print('C-1 pressed')
  require('bufferline.api').goto_buffer(1)
end, { desc = 'Goto tab 1' })

vim.keymap.set('n', '<C-2>', function()
  require('bufferline.api').goto_buffer(2)
end, { desc = 'Goto tab 2' })

vim.keymap.set('n', '<C-3>', function()
  print('C-3 pressed')
  require('bufferline.api').goto_buffer(3)
end, { desc = 'Goto tab 3' })

vim.keymap.set('n', '<C-4>', function()
  require('bufferline.api').goto_buffer(4)
end, { desc = 'Goto tab 4' })

vim.keymap.set('n', '<C-5>', function()
  require('bufferline.api').goto_buffer(5)
end, { desc = 'Goto tab 5' })

vim.keymap.set('n', '<C-6>', function()
  require('bufferline.api').goto_buffer(6)
end, { desc = 'Goto tab 6' })

vim.keymap.set('n', '<C-7>', function()
  require('bufferline.api').goto_buffer(7)
end, { desc = 'Goto tab 7' })

vim.keymap.set('n', '<leader>tt', function()
  vim.cmd('NvimTreeToggle')
end, { desc = '[T]oogle[T]ree' })

-- linter quick fix
vim.keymap.set('n', '<leader>lf', function ()
  vim.cmd('Format')
end, { noremap=true, silent=true })

vim.keymap.set('n', '<leader>k', function()
  vim.cmd('move -2')
end)
vim.keymap.set('n', '<leader>j', function()
  vim.cmd('move +1')
end)

