-- github desktop
local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
end

vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- vim.keymap.set('n', '<leader>gd', function()
--     vim.cmd('silent! !github ' .. get_git_root())
-- end, { desc = '[G]ithub [D]esktop', silent = true })

-- linter quick fix
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd('Format')
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>k', function()
    vim.cmd('move -2')
end)
vim.keymap.set('n', '<leader>j', function()
    vim.cmd('move +1')
end)

vim.keymap.set('n', '<leader>F', ':Ag<space>', { noremap = true, silent = true })

-- format
vim.keymap.set('n', '<leader>ff', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'Format Go file' })

local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help,
    { noremap = true, silent = true, desc = "Show function signature help" })
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
    { noremap = true, silent = true, desc = "Show function signature help in insert mode" })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', noremap = true, silent = true })


-- harpoon2
local harpoon = require("harpoon")
-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end

vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })

for i = 1, 5 do
    vim.keymap.set("n", string.format("<leader>%d", i), function() harpoon:list():select(i) end)
    vim.keymap.set("n", string.format("<leader>hr%d", i), function() harpoon:list():remove_at(i) end)
end
vim.keymap.set("n", "<leader>hrc", function() harpoon:list():clear() end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
vim.keymap.set('n', '<leader>rt', vim.cmd.UndotreeToggle)

-- Novel reader
vim.keymap.set('n', '|', require('novel-reader').prev_chapter)
vim.keymap.set('n', '\\', require('novel-reader').next_chapter)

