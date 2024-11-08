require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {
      'encoding', 'fileformat', 'filetype',
      -- if adding options, create a new lua table within the lualine_x table
      {
        require('keepcursor').KeepCursorStatus,
        color = { fg = 'Normal' },
        cond = function ()
          -- this is a variable used inside keepcursor to track the state of currently enabled functions
          if _G.KeepCursorAt ~= nil then
            return true
          end
        end
      }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

