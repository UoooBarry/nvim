return {
    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },

    -- Comment filetype settings (migrated to config function)
    {
        "numToStr/Comment.nvim",
        config = function()
            local ft = require("Comment.ft")
            ft.set("javascript", { "//%s", "/**%s*/" })
        end
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        }
    },

    { 'dgox16/oldworld.nvim' },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },

    -- FZF & fuzzy finder
    { 'junegunn/fzf',               build = './install --bin' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end
    },
    {
        "kelly-lin/telescope-ag",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },

    -- Terminal
    { "numToStr/FTerm.nvim" },

    -- Dashboard
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper'
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'lewis6991/gitsigns.nvim' },
    { 'APZelos/blamer.nvim' },

    -- UI Enhancements
    { 'navarasu/onedark.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'numToStr/Comment.nvim' },

    -- Themes
    { "catppuccin/nvim",          name = "catppuccin" },
    { "rose-pine/neovim",         name = "rose-pine" },
    { 'AlexvZyl/nordic.nvim' },
    { 'Yazeed1s/minimal.nvim' },

    -- Keep cursor
    {
        "rlychrisg/keepcursor.nvim",
        config = function()
            require("keepcursor").setup({})
            require("keepcursor").ToggleCursorMid()
        end
    },

    -- UFO, fold
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { 'kevinhwang91/promise-async' }
    },

    -- undo tree
    {
        "mbbill/undotree"
    },

    -- neocodeium
    {
        "monkoose/neocodeium",
        event = "VeryLazy",
        config = function()
            local neocodeium = require("neocodeium")
            local filter_filetypes = { 'text' }
            neocodeium.setup({
                filter = function (bufnr)
                    if not vim.tbl_contains(filter_filetypes, vim.api.nvim_get_option_value('filetype',  { buf = bufnr})) then
                        return true
                    end

                    return false
                end
            })
            vim.keymap.set("i", "<A-f>", function()
                require("neocodeium").accept()
            end)
            vim.keymap.set("i", "<A-w>", function()
                require("neocodeium").accept_word()
            end)
            vim.keymap.set("i", "<A-a>", function()
                require("neocodeium").accept_line()
            end)
            vim.keymap.set("i", "<A-e>", function()
                require("neocodeium").cycle_or_complete()
            end)
            vim.keymap.set("i", "<A-r>", function()
                require("neocodeium").cycle_or_complete(-1)
            end)
            vim.keymap.set("i", "<A-c>", function()
                require("neocodeium").clear()
            end)
        end,
    }
}
