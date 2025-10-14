local function setfiletype(pattern, language)
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = pattern,
        command = "setfiletype " .. language,
    })
end

setfiletype("*.rabl", "ruby")
