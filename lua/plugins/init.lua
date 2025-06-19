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

    -- Avante dependencies
    { "stevearc/dressing.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "MeanderingProgrammer/render-markdown.nvim" },

    -- Optional dependency
    { "HakonHarnes/img-clip.nvim" },

    -- Avante main plugin
    {
        "yetone/avante.nvim",
        branch = "main",
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "MeanderingProgrammer/render-markdown.nvim",
            "HakonHarnes/img-clip.nvim",
        },
        config = function()
            require("avante_lib").load()
            require("avante").setup {
                provider = "deepseek",
                auto_suggestions_provider = "gemini_code",
                providers = {
                    deepseek = {
                        __inherited_from = "openai",
                        api_key_name = "DEEPSEEK_API_KEY",
                        endpoint = "https://api.deepseek.com",
                        model = "deepseek-coder",
                        max_tokens = 4096,
                    },
                    gemini_code = {
                        __inherited_from = "gemini",
                        api_key_name = "GEMINI_API_KEY",
                        model = "gemini-2.0-flash-thinking-exp-01-21",
                        max_tokens = 4096,
                    },
                },
                behaviour = {
                    auto_suggestions = false,
                },
            }
        end,
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
    }
}
