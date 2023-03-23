require("config.lsp.mason")
local setups = require("config.lsp.setups")
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        -- dump(server_name)
        if server_name ~= "rust_analyzer" then
            lspconfig[server_name].setup(setups[server_name]())
        end
    end,
})

vim.diagnostic.config({
    float = {
        source = true,
    },
})
