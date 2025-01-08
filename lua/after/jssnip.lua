-- Initialize LuaSnip if not already done
local luasnip = require 'luasnip'
local fmt = require("luasnip.extras.fmt").fmt

-- Define custom snippets for JavaScript
luasnip.add_snippets('javascript', {
    -- JSDoc comment snippet
    luasnip.snippet('jsdoc', fmt([[
/**
 * [description]
 * @param {[paramType]} [paramName]
 * @returns {[returnType]}
 */
    ]], {
        description = luasnip.insert_node(1, 'Description of the function'),
        paramType = luasnip.insert_node(2, 'paramType'),
        paramName = luasnip.insert_node(3, 'paramName'),
        returnType = luasnip.insert_node(4, 'returnType'),
    }, { delimiters = "[]" })
    )
})
