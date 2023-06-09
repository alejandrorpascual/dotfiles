return {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    config = function()
        require("oil").setup()
        bind("n", "_", function()
            require("oil").open()
        end)
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
