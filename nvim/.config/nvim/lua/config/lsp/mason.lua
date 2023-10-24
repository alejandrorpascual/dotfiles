local lspconfig = require("lspconfig")
local servers = require("config.lsp.servers")
local mason_lspconfig = require("mason-lspconfig")

local mason_servers = {}

for server, _ in pairs(servers) do
    local cmd = lspconfig[server].cmd[1]
    if vim.fn.executable(cmd) == 0 then
        table.insert(mason_servers, server)
    end
end

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "cssls",
        "gopls",
        "tailwindcss",
        "lua_ls",
        "prismals",
        "pyright",
    },
    automatic_installation = true,
})
