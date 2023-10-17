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
        bind("n", "<C-n>", ":NvimTreeToggle<CR>")
        bind("n", "<Leader>nf", ":NvimTreeFindFileToggle<CR>")
    end,
    lazy = false,
}
