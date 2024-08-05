return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "rafamadriz/friendly-snippets",
        -- "hrsh7th/cmp-nvim-lsp-signature-help", -- Speed up NVIM
        "onsails/lspkind-nvim",
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            -- optionally, override the default options:
            config = function()
                require("tailwindcss-colorizer-cmp").setup({
                    color_square_width = 2,
                })
            end
        }
    },
    config = function()
        require("config.cmp")
    end,
}
