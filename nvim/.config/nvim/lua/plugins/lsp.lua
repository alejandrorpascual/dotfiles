return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvimtools/none-ls.nvim",
        -- "jose-elias-alvarez/null-ls.nvim",
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
    },
    -- event = "VeryLazy",
    main = "config.lsp",
    opts = {
        mason = {
            enable = true,
            auto_install = true,
        },
    },
}

-- return {
--         "neovim/nvim-lspconfig",
--         -- event =  "VeryLazy",
--         dependencies = {
--             "wbthomason/lsp-status.nvim",
--             "nvimtools/none-ls.nvim",
--             {"williamboman/mason.nvim",
--                 opts = {
--                     ui = {
--                         border = "rounded"
--                     }
--                 }
--             },
--             "williamboman/mason-lspconfig.nvim",
--             "jose-elias-alvarez/typescript.nvim",
--             "folke/neodev.nvim",
--             -- "jose-elias-alvarez/null-ls.nvim",
--             "jayp0521/mason-null-ls.nvim",
--             "simrat39/rust-tools.nvim",
--         },
--         event = "VeryLazy",
--         main = "config.lsp",
--         opts = {
--             mason = {
--                 enable = true,
--                 auto_install = false,
--             },
--         },
--         { "onsails/lspkind-nvim" },
-- }
