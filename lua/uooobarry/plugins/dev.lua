return {
    {
        dir = "~/workspace/github/novel-reader.nvim",
        dev = true,
        ft = "text",
        config = function()
            local novel_reader = require("novel-reader")
            require("novel-reader").setup({
                default_pattern = "第\\d\\+章",
            })

            vim.keymap.set('n', '|', novel_reader.prev_chapter)
            vim.keymap.set('n', '\\', novel_reader.next_chapter)
        end
    }
}
