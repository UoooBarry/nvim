-- [[ Setting options ]]
-- See `:help vim.o`

-- if opened with a directory as argument, set it as cwd
local arg = vim.fn.argv(0)
if arg and arg:match("^oil://(.+)") then
    -- Extract the filesystem path from oil:// URL
    local dir = arg:match("^oil://(.+)")
    if dir and vim.fn.isdirectory(dir) == 1 then
        vim.cmd('cd ' .. dir)
        vim.cmd('Oil ' .. dir)
    end
elseif arg and vim.fn.isdirectory(arg) == 1 then
    -- Fallback for non-oil:// arguments
    vim.cmd('cd ' .. arg)
    vim.cmd('Oil ' .. arg)
end

-- Set highlight on search
vim.o.hlsearch = true

-- set yank clipboard to system
vim.o.clipboard = 'unnamed'

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.blamer_enabled = true -- enable git blamer

vim.opt.laststatus = 3

vim.diagnostic.config({
    virtual_text = true, -- 行内显示诊断信息
    signs = true,        -- 左边的诊断图标
    underline = true,    -- 下划线高亮
    update_in_insert = false,
    severity_sort = true,
})
