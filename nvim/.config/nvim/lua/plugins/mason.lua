return {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            border = "rounded",
        },
    },
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                automatic_installation = true,
            }
        },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
}
