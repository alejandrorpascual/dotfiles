local lsp_attach = require('config.lsp.attach')
local lsp_flags = require('config.lsp.flags')

return function(ops)
        return vim.tbl_extend("force", {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                lsp_attach(client, bufnr)
            end,
            flags = lsp_flags,
        }, ops)
end
