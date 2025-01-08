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
    ft.set('javascript', {'//%s', '/**%s*/'})
end
