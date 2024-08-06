return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "nvimtools/none-ls.nvim",
            dependencies = { "nvimtools/none-ls-extras.nvim" },
            opts = function(_, opts)
                if not opts.sources then opts.sources = {} end
                local go_nls = require("go.null_ls")
                opts.sources = vim.list_extend(opts.sources, {
                    go_nls.gotest(),
                    go_nls.gotest_action(),
                })
                return opts
            end,
            config = function()
                require("config.null-ls")
            end
        },
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "rounded",
                },
            },
        },
        "b0o/schemastore.nvim",
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
