local lsp_attach = require('config.lsp.attach')
local lsp_flags = require('config.lsp.flags')

return function(ops)
    return vim.tbl_extend("force", {
        on_attach = lsp_attach,
        flags = lsp_flags,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
                hint = {
                    enable = true,
                },
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    }, ops)
end
