-- barbar keysetting
vim.keymap.set('n', '<C-1>', function()
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

vim.keymap.set('n', '<leader>cr', function()
  require('bufferline.api').close_buffers_right()
end, { desc = 'Close buffers right' })

vim.keymap.set('n', '<leader>cl', function()
  require('bufferline.api').close_buffers_left()
end, { desc = 'Close buffers left' })

vim.keymap.set('n', '<leader>ca', function()
  require('bufferline.api').close_all_but_current_or_pinned()
end, { desc = 'Close all buffers' })
