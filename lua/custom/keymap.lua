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

vim.keymap.set('n', '<leader>F', ':Ag<space>', { noremap = true, silent = true })

