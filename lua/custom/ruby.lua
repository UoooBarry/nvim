local lspconfig = require("lspconfig")

local function get_ruby_version()
    local handle = io.popen("ruby -e 'print RUBY_VERSION'")
    if handle then
        local version = handle:read("*a")
        handle:close()
        return version
    end
    return nil
end

local function is_less_than_2_7(version)
    local major, minor = version:match("(%d+)%.(%d+)")
    major = tonumber(major)
    minor = tonumber(minor)
    return major < 2 or (major == 2 and minor < 7)
end

local ruby_version = get_ruby_version()

if ruby_version and is_less_than_2_7(ruby_version) then
    lspconfig.solargraph.setup({
        cmd = { "/Users/barry/.rbenv/shims/solargraph", "stdio" },
        settings = {
            solargraph = {
                diagnostics = true
            }
        }
    })
else
    lspconfig.ruby_lsp.setup({})
end
