local harpoon = require("harpoon")

harpoon:extend({
    UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-%>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", '<C-">', function()
            harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-r>", function()
            local idx = vim.fn.line(".")
            harpoon:list():remove_at(idx)

            harpoon.ui:close_menu()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
            harpoon:list():clear()

            harpoon.ui:close_menu()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { buffer = cx.bufnr })
    end,
})
