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
        "hrsh7th/cmp-nvim-lsp-signature-help", -- Speed up NVIM
        "onsails/lspkind-nvim",
    },
    config = function()
        require("config.cmp")
    end,
}
