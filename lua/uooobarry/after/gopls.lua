vim.lsp.config("gopls", {
  on_attach = function(_, bufnr)
    -- Enable formatting on save
    vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("GoFormatting", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
  settings = {
    gopls = {
      gofumpt = true, -- Use 'gofumpt' for stricter formatting
    },
  },
})
