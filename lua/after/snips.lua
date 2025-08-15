local luasnip = require 'luasnip'
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets('javascript', {
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

luasnip.add_snippets('ruby', {
    luasnip.snippet('def', fmt([[
def [function_name]
end
    ]], {
        function_name = luasnip.insert_node(1, 'name'),
    }, { delimiters = "[]" })
    )
})
