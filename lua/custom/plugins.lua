return function(use)
    use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }

    -- luasnip engine
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    -- comment file type setting
    local ft = require('Comment.ft')
    ft.set('javascript', { '//%s', '/**%s*/' })

    -- Avante
    -- -- Required plugins
    use 'stevearc/dressing.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'MeanderingProgrammer/render-markdown.nvim'

    -- Optional dependencies
    use 'HakonHarnes/img-clip.nvim'

    use {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make',
        config = function()
            require('avante_lib').load()
            require('avante').setup {
                provider = 'deepseek',
                vendors = {
                    deepseek = {
                        __inherited_from = 'openai',
                        api_key_name = 'DEEPSEEK_API_KEY',
                        endpoint = 'https://api.deepseek.com',
                        model = 'deepseek-coder',
                    },
                },
            }
        end,
    }
end
