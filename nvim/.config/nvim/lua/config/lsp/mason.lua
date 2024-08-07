local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "cssls",
        "gopls",
        "htmx",
        "tailwindcss",
        "lua_ls",
        "prismals",
        "pyright",
        "shellcheck"
    },
    automatic_installation = true,
})
