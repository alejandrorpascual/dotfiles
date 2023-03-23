return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    },
    config = function()
        require("config.nvim-tree")
    end,
    lazy = false,
}
