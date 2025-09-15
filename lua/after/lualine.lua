require('lualine').setup {
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {
            'encoding', 'fileformat', 'filetype',
            -- if adding options, create a new lua table within the lualine_x table
            {
                require('keepcursor').KeepCursorStatus,
                color = { fg = 'Normal' },
                cond = function()
                    -- this is a variable used inside keepcursor to track the state of currently enabled functions
                    if _G.KeepCursorAt ~= nil then
                        return true
                    end
                end
            },
            {
                function()
                    local status, serverstatus = require("neocodeium").get_status()

                    -- Tables to map serverstatus and status to corresponding symbols
                    local server_status_symbols = {
                        [0] = "󰣺 ", -- Connected
                        [1] = "󰣻 ", -- Connection Error
                        [2] = "󰣽 ", -- Disconnected
                    }

                    local status_symbols = {
                        [0] = "󰚩 ", -- Enabled
                        [1] = "󱚧 ", -- Disabled Globally
                        [3] = "󱚢 ", -- Disabled for Buffer filetype
                        [5] = "󱚠 ", -- Disabled for Buffer encoding
                        [2] = "󱙻 ", -- Disabled for Buffer (catch-all)
                    }

                    -- Handle serverstatus and status fallback (safeguard against any unexpected value)
                    local luacodeium = server_status_symbols[serverstatus] or "󰣼 "
                    luacodeium = luacodeium .. (status_symbols[status] or "󱚧 ")

                    return luacodeium
                end,
                color = { fg = '#9BE09A' },
                cond = require("neocodeium").is_enabled,
            },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
