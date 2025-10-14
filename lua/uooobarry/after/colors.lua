require("rose-pine").setup({
    styles = {
        transparency = true,
        italic = false
    }
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.schedule(function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end)
end

ColorMyPencils()
