return { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        "RRethy/nvim-treesitter-textsubjects",
        "nvim-treesitter/playground",
    },
    config = function()
        require("config.treesitter")
    end,
}
