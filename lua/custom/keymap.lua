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

for i=1, 9 do
	vim.keymap.set('n', string.format("<leader>%d", i), function()
		require('bufferline.api').goto_buffer(i)
	end, { desc = string.format("Go to buffer %d", i) })
end

vim.keymap.set('n', '<leader>zr', function()
  require('bufferline.api').close_buffers_right()
end, { desc = 'Close buffers right' })

vim.keymap.set('n', '<leader>zl', function()
  require('bufferline.api').close_buffers_left()
end, { desc = 'Close buffers left' })

vim.keymap.set('n', '<leader>za', function()
  require('bufferline.api').close_all_but_current_or_pinned()
end, { desc = 'Close all buffers' })

-- format
vim.keymap.set('n', '<leader>ff', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format Go file' })

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
