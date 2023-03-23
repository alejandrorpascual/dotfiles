local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
local servers = mason_lspconfig.get_installed_servers()
mason_lspconfig.setup({
    ensure_installed = servers
})
