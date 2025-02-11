require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
    },
    }

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- folding block
    use { 'neoclide/coc.nvim', branch = 'release' }
    use { 'dgox16/oldworld.nvim' }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- fzf lua
    use {
        'nvim-tree/nvim-web-devicons'
    }

    -- terminal
    use "numToStr/FTerm.nvim"

    use { 'junegunn/fzf', run = './install --bin', }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- project
    use "pluffie/neoproj"
    -- dashboard
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                theme = 'hyper'
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    use 'navarasu/onedark.nvim'     -- Theme inspired by Atom
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'numToStr/Comment.nvim'     -- "gc" to comment visual regions/lines
    use 'APZelos/blamer.nvim'       -- Gitblame

    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim",
        as = "rose-pine"
    }                          -- RosePine
    use 'AlexvZyl/nordic.nvim' -- Nordic theme
    use 'Yazeed1s/minimal.nvim'
    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- indentation
    use "lukas-reineke/indent-blankline.nvim"

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    -- Telescope Ag command
    use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })

    use { 'nvim-tree/nvim-tree.lua', config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            filters = {
                dotfiles = true,
            },
            hijack_netrw = true,
        })
    end }

    -- keep cursor
    use({
        "rlychrisg/keepcursor.nvim",
        config = function()
            require("keepcursor").setup({})
            require("keepcursor").ToggleCursorMid()
        end
    })

    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end
end)
