return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "nvimtools/none-ls.nvim",
            dependencies = { "nvimtools/none-ls-extras.nvim" }
        },
        event = "VeryLazy",
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "rounded",
                },
            },
        },
        "b0o/schemastore.nvim",
        "folke/neodev.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "nvimdev/lspsaga.nvim",
    },
    main = "config.lsp",
    opts = {
        mason = {
            enable = true,
            auto_install = true,
        },
    },
}
