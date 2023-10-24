local lsp_attach = require('config.lsp.attach')
local lsp_flags = require('config.lsp.flags')

return function(ops)
    local config = {
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            lsp_attach(client, bufnr)
        end,
        flags = lsp_flags,
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    }

      if vim.fn.executable "json-languageserver" == 1 then
        config.cmd = { "json-languageserver", "--stdio" }
      end

    return vim.tbl_extend("force",  config, ops)
end
