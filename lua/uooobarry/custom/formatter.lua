vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })  -- Use sync formatting to ensure it completes before write
    end,
})
